class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2, :facebook, :github]
  

  has_many :likes, dependent: :destroy
  
  validates :password, length: { minimum: 8 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :email, presence: true, uniqueness: true

def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # # Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create(
           email: data['email'],
           password: Devise.friendly_token[0,20]
        )
    end
    user
end

# def self.from_omniauth(access_token)
#       #debugger
#       data = access_token.info
#       user = User.where(email: data['email']).first
      
#      unless user
#           user = User.create(
#              email: data['email'],
#              password: Devise.friendly_token[0,20]
#           )
#       end
#       user 
#     end


def self.from_omniauth(auth)
  name_split = auth.info.name.split(" ")
  #debugger
  user = User.where(email: auth.info.email).first
  user ||= User.create!(provider: auth.provider, uid: auth.uid, email: auth.info.email, password: Devise.friendly_token[0, 20])
    user
end
end