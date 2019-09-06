class Post < ApplicationRecord
	belongs_to :company
	

   mount_uploader :attachment, AttachmentUploader 
   validates :name, presence: true
   validates :sender, presence: true
   validates :received, presence: true
end
