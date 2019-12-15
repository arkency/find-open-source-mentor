# frozen_string_literal: true

class ProjectsController < ApplicationController
  include ProjectHelper

  before_action :authenticate_user!
  before_action :authorize!, only: %i[edit update destroy]
  before_action :current_project, only: %i[show edit update destroy]
  before_action :fetch_repo_by_name, only: %i[new edit create]
  after_action  :fetch_repos, only: %i[new edit create]

  def index
    @projects = Project.all
  end

  def show; end

  def new
    @project = Project.new
  end

  def edit; end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
      else
        format.html { render :new }
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
    end
  end

  private

  def fetch_repos
    @repos = ::Project::FetchRepos.call(current_user)
  end

  def fetch_repo_by_name
    @repo = fetch_repos.map(&:name)
  end

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
