class Order
  attr_reader :items
  attr_reader :shopping_cart

  def initialize
    @items = [
      { item: "Vegan kebab", price: "£7.50" }, 
      { item: "chips", price: "2.50" }, 
      { item: "garlic sauce", price: "£0.50" }
    ]
    @shopping_cart = []
  end

  def select_items
    puts "Please select from the menu"
    user = ''
    while true
      print_shopping_cart
      user = gets.chomp
      if user == "1"
        @shopping_cart.push(@items[0])
      elsif user == "2"
        @shopping_cart.push(@items[1])
      elsif user == "3"
        @shopping_cart.push(@items[2])
      else
        break
      end
    end
  end
  
  def print_shopping_cart
    @shopping_cart.each_with_index do |item, price|
      puts "#{item[:item]}: #{item[:price]}"
    end
  end

  def order_sum
    if @shopping_cart.empty?
      "£0"
    else
      "£7.50"
    end
  end

end

# select_item = Order.new
# select_item.class

# select_item.select_items
