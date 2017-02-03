class GithubService

  def initialize(token)
    @token = token
    @conn = Faraday.new(url: "https://api.github.com/") do |faraday|
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
      faraday.params[:access_token] = token
    end
  end

  def user
    response = @conn.get("/user")
    JSON.parse(response.body, symbolize_names: true)
  end

  def repos
    response = @conn.get("/user/repos")
    JSON.parse(response.body, symbolize_names: true)
  end

  def pull_requests(username)
    find_repos.map do |repo|
      if repo[:owner][:login] == username
        single_response = @conn.get("/repos/#{username}/#{repo[:name]}/pulls")
        JSON.parse(single_response.body, symbolize_names: true)
      end
    end.compact
  end

  def find_repos
    response = @conn.get("/user/repos")
    all_repos = JSON.parse(response.body, symbolize_names: true)
  end

  def find_commits(username)
    find_repos.map do |repo|
      if repo[:owner][:login] == username
        single_response = @conn.get("/repos/#{username}/#{repo[:name]}/events")
        JSON.parse(single_response.body, symbolize_names: true)
      end
    end.compact
  end
end
