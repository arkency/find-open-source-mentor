# frozen_string_literal: true

class User < ApplicationRecord
  ROLES = %w[mentee mentor].freeze
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable
  has_many :projects
  validates :role, presence: true, inclusion: { in: ROLES }

  enum role: ROLES

  def self.from_omniauth(auth, params)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid      = auth.info.nickname
      user.role     = params['role']
      user.email    = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
