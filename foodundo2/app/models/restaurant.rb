class Restaurant < ActiveRecord::Base
	has_many :res_dishes
	has_many :dishes, through: :res_dishes,source: :dish
end
