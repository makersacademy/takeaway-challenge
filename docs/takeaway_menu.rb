class Menu
  attr_reader :dish_class, :menu_list

  def initialize(dish_class = Dish)
    @menu_list = []
    @dish_class = dish_class
  end

  def load
    file = File.open("menu_data.csv", "r")
    file.readlines.each do |line|
    dish_name, dish_price = line.chomp.split(', ')
      @menu_list << {dish_name: dish_name, dish_price: dish_price.to_i}
    end
    file.close
  end

  def add(dish_name, dish_price)
    dish_entry = @dish_class.new(dish_name, dish_price).dish_entry
    @menu_list << dish_entry
  end

  def save
    # open the file for writing
    file = File.open("menu_data.csv", "w")
    # iterate over the array of dishes
    @menu_list.each do |dish|
      dish_info = [dish[:dish_name], dish[:dish_price]]
      csv_line = dish_info.join(', ')
      file.puts csv_line
    end
    file.close
  end

  def print
    @menu_list
  end
 
end

class Dish
  attr_accessor :dish_entry
  def initialize(dish_name, dish_price)
    @dish_entry = { :dish_name => dish_name, :dish_price => dish_price}
  end
end

class Order
  attr_reader :menu_list, :pending, :total_price

  def initialize
    @menu_list = []
    @pending = []
    @completed = []
    @total_price = 0
  end

  def menu
    # load menu_list that is created and edited by the Menu class.
    file = File.open("menu_data.csv", "r")
    file.readlines.each do |line|
    dish_name, dish_price = line.chomp.split(', ')
      @menu_list << {dish_name: dish_name, dish_price: dish_price.to_i}
    end
    file.close
    # print loaded menu_list.
    @menu_list
  end

  def add(dish_name)
    @dish_order = dish_lookup(dish_name)
    @pending << @dish_order
    @total_price += @dish_order[:dish_price]
  end
  
  def dish_lookup(dish_name)
    @menu_list.find { |hash| hash[:dish_name] == dish_name }
  end

  def delete(dish_name)
    delete_order_hash = dish_lookup(dish_name)
    @pending.delete_if { |hash| hash == delete_order_hash }
    @total_price -= delete_order_hash[:dish_price]
  end
  
  def complete
    @completed = @pending
  end

end
