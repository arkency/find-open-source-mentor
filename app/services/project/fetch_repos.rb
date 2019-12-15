# frozen_string_literal: true

class Project
  class FetchRepos
    include Callable

    attr_reader :current_user

    def initialize(current_user)
      @current_user = current_user
    end

    def call
      client.repos(github_user.login, query: { type: 'owner', sort: 'asc' })
    end

    private

    def client
      Octokit::Client.new
    end

    def github_user
      client.user(current_user.nickname)
    end
  end
end
