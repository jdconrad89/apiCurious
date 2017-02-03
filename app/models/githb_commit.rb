class GithubCommit
  attr_reader :committer,
              :author,
              :message,
              :comment_count

  def initialize(attrs = {})
    @committer     = attrs[:committer]
    @author        = attrs[:author]
    @message       = attrs[:message]
    @comment_count = attrs[:comment_count]
  end

  def self.get_commits(user)
    GithubService.find_commits(repo_name, user).map do |raw_commit|
      new(raw_commit[:commit])
    end
  end

end
