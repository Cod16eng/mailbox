class Company < ApplicationRecord
	has_many :posts
	belongs_to :user
	
	validates :name, presence: true,
			  uniqueness: {case_sensitive: false}
end