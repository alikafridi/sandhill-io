class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

	#validates :email, :presence => true, :email => true, uniqueness: true
	validate :email_domain

  def email_domain
    domain = email.split("@").last
    if !email.blank?
      errors.add(:email, "Must use an @afridi.io email to register for the time being") if domain != "afridi.io"
    end
  end
end
