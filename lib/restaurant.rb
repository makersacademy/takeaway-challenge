require_relative "menu.rb"

class Restaurant

  attr_reader :current_menu

  def initialize options
    @menu = options[:menu]
    @menu_content = options[:options]
    populate_menu
  end

  def populate_menu
    @current_menu = @menu.new(@menu_content)
  end

  # def check_order menu, order
  # end

end

# pizza_hut = Restaurant.new({ menu: Menu , options: { dishes: { rice: 10.99, pizza: 5.99 } } })

# test_hash = { menu: Menu , options: { dishes: { rice: 10.99, pizza: 5.99 } } }

# p test_hash[:menu]
# p test_hash[:options]

# pizza_hut = Restaurant.new({ menu: Monkey , options: { dishes: { rice: 10.99, pizza: 5.99 } } })

