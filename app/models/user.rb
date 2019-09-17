# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize.tap do |user|
      user.nickname = auth.info.nickname
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.save!
    end
  end

  has_many :projects
end
