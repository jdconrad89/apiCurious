class User < ApplicationRecord

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
end
