class Company < ApplicationRecord
	has_many :mails
	belongs_to :user
	
	validates :name, presence: true,
			  uniqueness: {case_sensitive: false}
end