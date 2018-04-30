class WelcomeController < ApplicationController
  def top
  end
  def index
    @users = User.all
    # @users.each do |info|
    #   @client = Octokit::Client.new(:oauth_token => info.oauth_token)
    # end
    client = Octokit::Client.new(:oauth_token => current_user.oauth_token)
    @repos = client.refs[:repos].get.data
  end
end
