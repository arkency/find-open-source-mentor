class RepositoriesController < ApplicationController
  before_action :authenticate_user!

  def new
    token = request.env["omniauth.auth"]
    @client = Octokit::Client.new(client_id: @client_id)
    # (access_token: token)
    # url = @client.authorize_url(@client_id, :scope => 'user:email')
    # redirect url

    @client.repos
  end
end
