class WelcomeController < ApplicationController
  def top
  end
  def index
    @users = User.all
    @users.each do |user_info|
      @client = Octokit::Client.new(:access_token => user_info.oauth_token)
    end
  end
  def show
    @user = User.find(params[:id])
    @client = Octokit::Client.new(:access_token => @user.oauth_token)
  end

  private

  def user_params
    params.require(:user).permit(
      :name, :uid, :provider, :oauth_token,
      :avatar_image, :repos_info
    )
  end
end
