class User < ApplicationRecord
  has_many :repositories

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
end
