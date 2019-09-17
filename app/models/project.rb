# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :user
  has_many :repositories

   accepts_nested_attributes_for :repositories, reject_if: :all_blank, allow_destroy: true
end
