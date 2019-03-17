class List

  def initialize
    @list = {
      1 => { name: "Onion, Rosemary & Cheddar",  price: 11},
      2 => { name: "Smoked Cod’s Roe, Fermented Cabbage & Caraway",  price: 20},
      3 => { name: "Duck Sausage & Fennel",  price: 25},
      4 => { name: "Nest Soda Bread with Whipped Duck Fat",  price: 10},
      5 => { name: "Beetroot & Smoked Eel",  price: 12},
      6 => { name: "Scottish Langoustine (+£7)",  price: 10},
      7 => { name: "Cornish Halibut, Squid & Mushroom",  price: 8},
      8 => { name: "Goosnagh Duck",  price: 10},
      9 => { name: "Chocolate & Stout",  price: 13},
      10 => { name: "British Cheeses",  price: 15},
      11 => { name: "Homemade Oatcakes",  price: 10},
    }
    @selected_dishes = []
  end

  def add_list(list)
    @list = list
  end

  def show_dishes
    @list.each do |order, dish|
       puts "#{order}: #{dish[:name]} - #{dish[:price]}"
    end
  end
  
  def select_dishes(*args)
    args.each do |order_number|
      @selected_dishes << Dish.new(@list[order_number][:name], @list[order_number][:price]) if available_dish(order_number)
    end
    @selected_dishes
  end

  Dish = Struct.new(:name, :price) # move to a class?

  def show_selected_dishes
    @selected_dishes.each do |dish|
      puts "#{dish.name} = #{dish.price}" # this knows the data structure's components
    end
    puts "Total: #{total(@selected_dishes)}"
  end

  def total(selected_dishes)
    selected_dishes.reduce(0) {|total,dish| total + dish[:price]}
  end

  private

  def available_dish(order_number)
    @list.key? order_number
  end
end
