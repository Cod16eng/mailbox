class User < ApplicationRecord
	has_many :companies, dependent: :destroy
	

	before_save { self.email = email.downcase }

	validates :first_name, :last_name, presence: true, 
			   
	          length: {minimum: 3, maximum: 50}
	
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, 
			  uniqueness: {case_sensitive: false}, 
	          length: { maximum: 105},
	          format: { with: VALID_EMAIL_REGEX }

	has_secure_password

	def self.search(search)
	    users = all
	  if search
	    where('first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ?',"%#{search}%", "%#{search}%", "%#{search}%")
	  else
	    all
	  end
	end

	def name
		"#{first_name} #{last_name}".titleize
	end
end