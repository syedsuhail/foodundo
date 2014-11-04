class Dish < ActiveRecord::Base
	has_many :res_dishes
	#accepts_nested_attributes_for :res_dishes
	has_many :restaurants,through: :res_dishes,source: :restaurant
end
