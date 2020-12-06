class Order 
  attr_reader :basket, :selected_dish, :menu, :total_price

  def initialize
    @menu = [
      { name: "Bangers & Mash", price: 8.49, available: true },
      { name: "Chips & Gravy", price: 3.19, available: true },
      { name: "Fish Pie", price: 9.89, available: true },
      { name: "Casserole", price: 7.79, available: true }
    ]
    @basket = []
    @selected_dish = nil
    @total_price = 0
  end
  
  def see_list
    @menu.each_with_index { |item, index|
      puts "#{index + 1}. #{item[:name]} - £#{item[:price]}"
    }
  end

  def find_dish_details(dish)
    # [0] had to select the 0th index because the hash is in an array
    @selected_dish = @menu.select { |item| 
      item[:name] == dish
    }[0]
  end

  def make_unavailable(dish)
    find_dish_details(dish)
    @selected_dish[:available] = false
  end
 
  def add_to_basket(dish, quantity)
    find_dish_details(dish)

    fail "#{dish} is not available" unless @selected_dish[:available]
    
    update_selected_dish(quantity)

    @basket << @selected_dish
  end

  def update_selected_dish(quantity)
    @selected_dish[:quantity] = quantity
    @selected_dish[:price] *= quantity
  end

  def sum_of_prices
    @basket.each { |item|
      @total_price += item[:price]
    }
  end

  def total
    sum_of_prices
    @total_price
  end

  def print_summary
    puts "total due: #{total}"
    @basket.each { |item|
      puts "dish: #{item[:name]} quantity: #{item[:quantity]} price: #{item[:price]}"
    }
  end
end
