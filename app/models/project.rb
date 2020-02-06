# frozen_string_literal: true

class Project < ApplicationRecord
  include PublicActivity::Model
  tracked owner: proc { |controller, _model| controller.current_user }
  validates :name, presence: true

  belongs_to :user

  validates :name, presence: true
end
