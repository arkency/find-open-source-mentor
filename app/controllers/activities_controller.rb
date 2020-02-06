# frozen_string_literal: true

class ActivitiesController < ApplicationController
  def index
    @activities = PublicActivity::Activity.includes(:owner).order(created_at: :desc).limit(20)
  end
end