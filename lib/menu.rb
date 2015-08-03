require 'terminal-table'

class Menu

	attr_reader :table

	def self.list
		rows = []
		rows << ["1. Chicken Fry Rice", 6.59]
		rows << ["2. Curry Beef Rice", 5.59]
		rows << ["3. Sweet King Prawns", 7.59]
		rows << ["4. Mushroom Soup", 4.59]
		rows << ["5. Hot & Sour Soup", 4.59]
		table = Terminal::Table.new :title => "Chinese Takeaway", :headings => ['Dish Name','Price(£)'], :rows => rows
		table.align_column(1,:center)
		puts table
	end
end