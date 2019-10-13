# frozen_string_literal: true

class User < ApplicationRecord
  ROLES = %w[mentee mentor].freeze

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable
         
  has_many :projects
  validates :role, presence: true, inclusion: { in: ROLES }

  enum role: ROLES

  def self.from_omniauth(auth, params)
    where(email: auth.info.email).first_or_initialize.tap do |user|
      user.nickname = auth.info.nickname
      user.email    = auth.info.email
      user.role     = params['role']
      user.password = Devise.friendly_token[0, 20]
      user.save!
    end
  end
end
