class RepositoriesController < ApplicationController
  before_action :authenticate_user!

  def new
    # @client      = Octokit::Client.new
    # @github_user = @client.user(current_user.nickname)
    # @repositories = @client.repos(@github_user.login, query: { type: 'owner', sort: 'asc' })
  end 
end
