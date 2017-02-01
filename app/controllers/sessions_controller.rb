class SessionsController < ApplicationController
  def create

    @response = Faraday.post("https://github.com/login/oauth/access_token?client_id=#{ENV["CLIENT_ID"]}&client_secret=#{ENV["CLIENT_SECRET"]}&code=#{params["code"]}")
    token = @response.body.split(/\W+/)[1]

    oauth_response = Faraday.get("https://api.github.com/user?access_token=#{token}")
    auth = JSON.parse(oauth_response.body)

    user = User.find_or_create_by(uid: auth["id"])
    user.username = auth["login"]
    user.uid = auth["id"]
    user.avatar = auth["avatar_url"]
    user.url = auth["html_url"]
    user.followers = auth["followers"]
    user.following = auth["following"]
    user.repo = auth["repos_url"]
    user.token = token
    if user.save
      session[:user_id] = user.id
      redirect_to dashboard_index_path
    else
      redirect_to root_path
    end
  end

end
