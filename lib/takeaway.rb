class Order
  attr_reader :items
  attr_reader :shopping_cart

  def initialize
    @items = [
      { item: "Vegan kebab", price: 7.50 }, 
      { item: "chips", price: 2.50 }, 
      { item: "garlic sauce", price: 0.50 }
    ]
    @shopping_cart = []
  end

  def show_menu
    puts "Please select from the menu below."
    @items.each_with_index do |item, index|
      puts "#{index + 1}. #{item[:item]}: £#{'%.2f' % item[:price]}"
    end
  end 

  def select_items
    show_menu
    @user = ''
    loop do
      print_shopping_cart
      user = gets.chomp
      break unless /^[0-9]*$/.match?(user)
      @shopping_cart.push(@items[user.to_i - 1])
    end
  end
  
  def print_shopping_cart
    @shopping_cart.each do |item|
      puts "#{item[:item]}: £#{'%.2f' % item[:price]}"
    end
  end

  def order_sum
    if @shopping_cart.empty?
      0.00
    else
      sum = 0
      @shopping_cart.each do |item|
        sum += item[:price]
      end
      puts "Here your order total. Is that correct?"
      sum
    end
  end

end

# select_item = Order.new
# select_item.class

# select_item.select_items
