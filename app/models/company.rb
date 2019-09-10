class Company < ApplicationRecord
	has_many :posts, dependent: :destroy
	belongs_to :user
	
	validates :name, presence: true,
			  uniqueness: {case_sensitive: false}

	def self.search(search)
	    companies = all
	  if search
	    where('name ILIKE ?', "%#{search}%")
	  else
	    all
	  end
	end
end