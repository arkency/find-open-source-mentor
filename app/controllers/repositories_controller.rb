class RepositoriesController < ApplicationController
  before_action :authenticate_user!

  def new
    @client      = Octokit::Client.new
    @github_user = @client.user(current_user.uid)
    binding.pry
    @repos       = @client.repos(@github_user.login, query: { type: 'owner', sort: 'asc' })
  end 
end
