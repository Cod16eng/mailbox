class Search < ApplicationRecord
	def posts
	  @posts ||= find_posts
	end

	private

	def find_posts
	  posts = Post.order('created_at DESC')
	  posts = posts.where("name ILIKE ?", "%#{keywords}%") if keywords.present?
	  posts = posts.where(company_id: company_id) if company_id.present?
	  posts = posts.where("sender ILIKE ?", "%#{sender}%") if sender.present?
	  posts = posts.where("cast(received as text) like ?", "%#{received}%" ) if received.present?
	  posts
	end
end
