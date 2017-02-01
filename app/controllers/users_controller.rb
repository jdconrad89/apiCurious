class UsersController < ApplicationController

  def repos
    user = User.find_by(uid: current_user.uid)
    @repos = user.repos
    @pull_requests = user.pull_requests(user[:username])
  end
end
