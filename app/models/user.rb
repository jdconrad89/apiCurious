class User < ApplicationRecord

  def avatar
    user = GithubService.new(token).user
    avatar = user[:avatar_url]
  end

  def star_count
    stars = GithubService.new(token).starred
    stars_count = stars.count
  end

  def followers_count
    user = GithubService.new(token).user
    followers = user[:follwers]
  end

  def following_count
    user = GithubService.new(token).user
    following = user[:following]
  end

  def oragnainization_names
    user_orgnaizations = Githubservice.new(token).oragnainization_names
    user_orgnaizations.map do |organization|
      oragnainization_names
    end
  end

  def repos
    repos = GithubService.new(token).repos
    repos.map do |repo|
      repo
    end
  end

  def pull_requests(username)
    pull_requests = GithubService.new(token).pull_requests(username)
    pull_requests.reject { |pr| pr[0].nil? }
  end

  def commits(username)
    commits = GithubService.new(token).find_commits(username)
    commits.map do |commit|
      commit
    end
  end

  def following_activity
    events = GithubService.new(token).find_events
    events.map do |event|
      event
    end
  end

  def mentions
    mentions = GithubService.new(token).find_mentions
    mentions.map do |mention|
      mentions
    end
  end

  def create_repo(name)
    NewRepoService.new(token).create_repo(name = name)
  end
end
