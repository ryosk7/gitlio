class WelcomeController < ApplicationController
  def top
  end
  def index
    @users = User.all
    # @users.each do |user_info|
    #   @client = Octokit::Client.new(:access_token => user_info.oauth_token)
    # end
    # @chart_data = [['2014-04-01', 60], ['2014-04-02', 65], ['2014-04-03', 64]]
  end
  def show
    @user = User.find(params[:id])
    # @client = Octokit::Client.new(:access_token => @user.oauth_token)
    langs = @user.repositories.map { |repo| repo.language.name }.compact
    lang_hash = {}
    langs.each do |lang|
      count = langs.count(lang)
      lang_hash[lang] = count
    end
    @chart_data = lang_hash
  end

  private

  def user_params
    params.require(:user).permit(
      :name, :uid, :provider, :oauth_token,
      :avatar_image, :repos_info
    )
  end
end
