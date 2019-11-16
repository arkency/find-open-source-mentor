# frozen_string_literal: true

class ProjectsController < ApplicationController
  include ProjectHelper

  before_action :authenticate_user!
  before_action :authorize!, only: %i[edit update destroy]
  before_action :current_project, only: %i[show edit update destroy]

  def index
    @projects = Project.all
  end

  def show; end

  def new
    @project = Project.new
    fetch_repos
    fetch_repo
  end

  def fetch_repos
    @client      = Octokit::Client.new
    @github_user = @client.user(current_user.nickname)
    @repos       = @client.repos(@github_user.login, query: { type: 'owner', sort: 'asc' })
  end

  def fetch_repo
    @repo = @repos.map(&:name)
  end

  def edit
    current_project
    fetch_repos
    fetch_repo
  end

  def create
    @project = Project.new(project_params)
    fetch_repos
    fetch_repo

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
    if @project.update(project_params)
      redirect_to project_path(@project),
                  flash: { notice: 'Project updated.' }
    else
      render :edit,
             flash: { error: @project.errors.full_messages.to_sentence }
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

  def current_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit!
  end
  
  def authorize!
    current_project
    authorize(@project || Project)
  end
end
