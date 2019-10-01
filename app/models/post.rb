class Post < ApplicationRecord
	belongs_to :company
	

   mount_uploader :attachment, AttachmentUploader 
   validates :name, presence: true
   validates :sender, presence: true
   validates :received, presence: true

    def self.search(search)
	    posts = all
	  if search
	    where('name ILIKE ? OR sender ILIKE ? OR cast(received as text) ILIKE ?',"%#{search}%", "%#{search}%", "%#{search}%")
	  else
	    all
	  end
	end
end
