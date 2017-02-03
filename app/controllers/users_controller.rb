class UsersController < ApplicationController

  def repos
    user = User.find_by(uid: current_user.uid)
    @repos = user.repos
    @pull_requests = user.pull_requests(user[:username])
  end

  def new_repo
    user = User.find_by(uid: current_user.uid)
    user.create_repo(params["name"])
    redirect_to repos_path
  end

  def commits
    user = User.find_by(uid: current_user.uid)
    @commits = user.commits(user.username)
    @commits.second.

  end

end
