# frozen_string_literal: true

class Project < ApplicationRecord
  validates :name, presence: true

  belongs_to :user

  validates :name, presence: true
end
