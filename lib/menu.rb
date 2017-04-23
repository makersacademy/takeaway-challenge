require_relative 'dish'
require 'csv'

class Menu

	@@menus = []

	def self.list_menus
		menu_counter = 1
		@@menus.each { |menu| 
			puts 'Menu ' + menu_counter + ': ' + menu.list_dishes
			menu_counter += 1
		}
		menu_counter
	end

	def self.select_menu(number)
		@@menus[number - 1]
	end

	def initialize
		@dishes = []
	end

	def add_dish(dish)
		raise ArgumentError, 'Not a valid dish object' unless dish.instance_of? Dish
		@dishes << dish.to_hash
	end

	def list_dishes
		@dishes
	end

	def save_csv(filename)
	 	CSV.open(filename, 'wb') { |csv| 
		@dishes.each {|dish| csv << dish }
		}
	end

	def load_csv(filename)
		CSV.foreach(filename) { |row| 
			name, price = row
			@dishes << {name: name.downcase, price: price}
		}
	end

	def save_menu
		@@menus << self
	end
end
