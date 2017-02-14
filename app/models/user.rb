class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :products
  has_many :orders
  has_many :reviews

  def full_name
  	first_name + " " + last_name
  end

  def self.omniauth_facebook(auth)
    user = User.where(email: auth.info.email).first

    if user
      return user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.description = auth.info.description
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
      end
    end
  end

end