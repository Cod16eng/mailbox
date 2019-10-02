namespace :custom do
	desc 'Remove searches older than a month'
	task :remove_old_searches => :environment do
	  Search.delete_all
	end
end
