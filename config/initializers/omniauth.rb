Rails.application.config.middleware.use OmniAuth::Builder do
  # if Rails.env == 'development'
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: "user,public_repo"
  # elsif Rails.env == 'production'
  #   provider :github, ENV['GITHUB_KEY_HEROKU'], ENV['GITHUB_SECRET_HEROKU '], scope: "user,repo"
  # end
end
