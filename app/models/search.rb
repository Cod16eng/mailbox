class Search < ApplicationRecord
	def posts
	  @posts ||= find_posts
	end

	private

	def find_posts
	  posts = Post.joins(:company).order(:name)
	  posts = posts.where("name like ?", "%#{name}%") if name.present?
	  posts = posts.where(company_id: company_id) if company_id.present?
	  posts = posts.where("sender like ?", "%#{sender}%") if sender.present?
	  posts = posts.where("cast(received as text) like ?", "%#{received}%" ) if received.present?
	  posts
	end
end
