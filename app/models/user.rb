class User < ApplicationRecord

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['nickname']
      user.oauth_token = auth['credentials']['token']
      user.avatar_image = auth['extra']['raw_info']['avatar_url']
      user.repos_info = auth['extra']['raw_info']['repos_url']
    end
  end
end
