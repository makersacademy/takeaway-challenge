class Takeaway
  def initialize(menu, customer)
    @menu = menu
    @customer = customer
  end

  def show_menu
    @menu.items.each_pair do |item_number, item|
      puts "#{item_number}. #{item[:name]}: £#{item[:price]}\n"
    end

    puts
  end

  def add_to_cart(item_number, quantity)
    quantity.times { @customer.cart << @menu.items[item_number] }
  end
end
