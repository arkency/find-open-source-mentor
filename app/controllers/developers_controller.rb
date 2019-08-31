# frozen_string_literal: true

class DevelopersController < ApplicationController
  def index
    @developers = Developer.all.where(junior: true)
  end
end
