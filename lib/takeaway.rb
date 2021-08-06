class Takeaway
  def initialize(menu, customer)
    @menu = menu
    @customer = customer
  end

  def show_menu
    @menu.items.each_pair do |item_number, item|
      puts "#{item_number}. #{item[:name]}: £#{item[:cost]}\n"
    end

    puts
  end

  def add_to_order(item_number, quantity)
    quantity.times do
      @customer.order[:items] << @menu.items[item_number]
      @customer.order[:total_cost] += @menu.items[item_number][:cost]
    end
  end
end
