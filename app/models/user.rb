class User < ApplicationRecord
  has_many :repositories
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['nickname']
      user.oauth_token = auth['credentials']['token']
      user.avatar_image = auth['extra']['raw_info']['avatar_url']
      user.bio = auth['extra']['raw_info']['bio']
      user.full_name = auth['info']['name']
    end
  end
  def save_repositories!
    client = Octokit::Client.new access_token: oauth_token
    repos = client.repositories(name, per_page: 100)
    repos.each do |repo|
      Repository.create(user: self, name: repo.name, star: repo.stargazers_count, language: Language.find_or_create_by(name: repo.language))
    end
  end
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end
  def following?
    following.include?(other_user)
  end
end
