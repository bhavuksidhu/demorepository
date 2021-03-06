class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :posts
    def self.from_omniauth(access_token)
	    data = access_token.info
	    user = User.where(:email => data["email"]).first

	    unless user
	      user = User.create(
	            name: data["name"],
	            email: data["email"],
	            encrypted_password: Devise.friendly_token[0,20]
	      )
	    end
    end
end
