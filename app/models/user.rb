# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[keycloakopenid]

  has_many :kids, dependent: :destroy

  class << self
    def from_omniauth(auth)
      user = User.find_by(email: auth.info.email) || User.find_by(provider: auth.provider, uid: auth.uid)

      if user
        user.update(provider: auth.provider, uid: auth.uid)
      else
        user = User.create(
          email: auth.info.email,
          password: Devise.friendly_token[0, 20],
          provider: auth.provider,
          uid: auth.uid
        )
      end

      user
    end
  end
end
