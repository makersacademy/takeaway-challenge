require_relative 'dish'
require 'csv'
require 'active_support'

class Menu

	@@menus = []
	cattr_reader :menus

	def initialize
		@dishes = []
	end

	def self.print_menus
		menu_counter = 0
		@@menus.each { |menu|
			puts "Menu #{menu_counter+1}: #{menu.get_dishes}"
			menu_counter += 1
		}
		menu_counter
	end

	def self.get_menu(number)
		@@menus[number - 1]
	end

	def set_menus
		@@menus << self
	end

	def get_dishes
		@dishes
	end

	def set_dishes(dish)
		unless dish.instance_of? Dish
			raise ArgumentError, 'Not a valid dish object'
		end
		@dishes << dish.to_hash
	end

	def save_to_csv(filename)
	 	CSV.open(filename, 'wb') { |csv|

			@dishes.each { |dish|
				row = []
				puts dish
				row << dish[:name] << dish[:price]
				csv << row
			}
		}
	end

	def load_from_csv(filename)
		CSV.foreach(filename) { |row|
			name, price = row
			@dishes << {name: name.downcase, price: price}
		}
	end

end
