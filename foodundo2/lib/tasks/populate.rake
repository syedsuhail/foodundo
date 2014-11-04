namespace :db do 
	desc "Erase and fill database"
	task populate: :environment do 
		require 'populator'

		Restaurant.all.each(&:delete_all)

		Restaurant.populate 20 do |hotel|
			hotel.name = Populator.words(1..3)
			hotel.address = Populator.words(1..5)
		end

	end
end
