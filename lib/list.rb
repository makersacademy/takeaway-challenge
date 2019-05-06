require_relative 'dish'

class List

  def initialize(dish = Dish)
    @list = {
      1 => dish.new("Onion, Rosemary & Cheddar", 11),
      2 => dish.new("Smoked Cod’s Roe, Fermented Cabbage & Caraway", 20),
      3 => dish.new("Duck Sausage & Fennel", 25),
      4 => dish.new("Nest Soda Bread with Whipped Duck Fat", 10),
      5 => dish.new("Beetroot & Smoked Eel", 12),
      6 => dish.new("Scottish Langoustine (+£7)", 10),
      7 => dish.new("Cornish Halibut, Squid & Mushroom", 8),
      8 => dish.new("Goosnagh Duck", 10),
      9 => dish.new("Chocolate & Stout", 13),
      10 => dish.new("British Cheeses", 15),
      11 => dish.new("Homemade Oatcakes", 10),
    }
    @selected_dishes = []
  end

  def add_list(list)
    @list = list
  end

  def show_dishes
    @list.each do |order, dish|
      puts "#{order}: #{dish.details}"
    end
  end
  
  def select_dishes(selection) 
    selection.each do |order_number|
      @selected_dishes << @list[order_number] if available_dish(order_number)
    end
    @selected_dishes
  end

  def show_selected_dishes
    @selected_dishes.each do |dish|
      puts "#{dish.name} = #{dish.price}" # this knows the data structure's components
    end
    puts "Total: #{total(@selected_dishes)}"
  end

  def total(selected_dishes)
    selected_dishes.reduce(0) {|total,dish| total + dish.price}
  end

  private

  def available_dish(order_number)
    @list.key? order_number
  end
end
