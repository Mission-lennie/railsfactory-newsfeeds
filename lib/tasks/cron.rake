namespace :Update do
	desc "Updating News into Database"
	task :tweet  => :environment do
		Tweet.storetweet
		
		end
end