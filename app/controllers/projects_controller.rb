class ProjectsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def show; end

  def new
    @project = Project.new
    @repos = repos
    @repo = repo
  end

  def repos
    @client      = Octokit::Client.new
    @github_user = @client.user(current_user.nickname)
    @repos       = @client.repos(@github_user.login, query: { type: 'owner', sort: 'asc' })
  end

  def repo
    @repos.map {|r| r.name }
  end

  def edit; end

  def create
    @project = Project.new(project_params)
    @repos = repos
    @repo = repo

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private


  def project_params
    params.require(:project).permit!
  end
end
