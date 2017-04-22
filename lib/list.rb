require 'CSV'
require_relative 'list_item'
$line_width = 80
$column_width = 40
class List

  def initialize
    @menu_items = []
  end

  def view_items(file = "takeawaylist.csv")
    reset_menu_items
    load_csv(file)
    print_menu
  end

  def select_items(user_input)
    user_input = user_input.split(/, /)
    check_input_formatting(user_input)
    check_items_are_on_menu(user_input)
    check_order_total(user_input)
  end

  private

  attr_accessor :menu_items, :user_input

  def load_csv(file)
    CSV.foreach(file) { |row| build_menu_item(row) }
  end

  def build_menu_item(row)
    name = row[0]
    price = row[1]
    menu_items << ListItem.new({ name: name.to_s, price: price.to_i })
  end

  def reset_menu_items
    self.menu_items = []
  end

  def print_menu
    print_header
    print_menu_items
    print_footer
  end

  def print_header
    puts "Menu Items".upcase.center($line_width)
    print "\n"
    print "-" * $line_width
    print "\n"
  end

  def print_menu_items
    menu_items.each do |item|
      print item.name.capitalize.ljust($column_width)
      print item.price.to_s.rjust($column_width)
      print "\n"
    end
  end

  def print_footer
    puts "-" * $line_width
  end

  def check_input_formatting(user_input)
    user_input[0..-2].each do |menu_item|
      raise RuntimeError, "Input formatted incorrectly" unless /[A-Za-z ]+ x\d+/ =~ menu_item
    end
    raise RuntimeError, "Input formatted incorrectly" unless /\A\$\d+/. =~ user_input[-1]
  end

  def check_items_are_on_menu(user_input)
    order_item_names = return_order_item_names_from_user_input(user_input)
    order_item_names.each do |name|
      unless names_of_items_on_menu.include?(name)
        raise RuntimeError, "Item entered that is not listed on menu"
      end
    end
  end 

  def check_order_total(user_input)
    cost_entered = user_input[-1].scan(/\d+/)[0].to_i
    order_item_names_and_quantities = return_order_item_names_and_quantities(user_input)
    actual_cost = calculate_actual_cost(order_item_names_and_quantities)
    raise RuntimeError, "Incorrect order price entered" unless actual_cost == cost_entered 
  end

  def return_order_item_names_from_user_input(user_input)
    user_input[0..-2].collect { |menu_item| menu_item =~ /([A-Za-z ]+(?= x\d+))/; $1 }
  end

  def names_of_items_on_menu
    menu_items.collect { |menu_item| menu_item.name }
  end

  def return_order_item_names_and_quantities(user_input)
    user_input[0..-2].collect do |menu_item|
      menu_item =~ /([A-Za-z ]+(?= x(\d+)))/; { name: $1, quantity: $2 } 
    end
  end

  def calculate_actual_cost(order_item_names_and_quantities)
    cost_grouped_by_menu_item = return_cost_grouped_by_menu_item(order_item_names_and_quantities)
    costs = cost_grouped_by_menu_item
    costs.delete(nil)
    costs.reduce(&:+)
  end

  def return_cost_grouped_by_menu_item(order_item_names_and_quantities)
    item_costs = order_item_names_and_quantities.collect do |order|
      menu_items.collect do |menu_item|
        menu_item.price * order[:quantity].to_i if menu_item.name == order[:name]
      end
    end
    item_costs.flatten!
  end

end
