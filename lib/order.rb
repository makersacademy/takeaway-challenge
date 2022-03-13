class Order
  attr_reader :current_items

  def initialize
    @current_items = []
  end

  def select_items(menu)
    loop do
      puts 'Choose a dish to add to your order'
      selection = gets.chomp
      break if selection.empty?

      dish = menu.find_by_name(selection)
      @current_items << dish unless dish.nil?
    end
  end
  
  def list_order
    @current_items.each do |item|
      puts "#{item.name} - #{item.price}"
    end
    puts "Total: #{order_total_price}"
  end
  
  def order_total_price
    "\£#{@current_items.map { |item| item.price }.sum}"
  end

  def add_to_order(item)
    @current_items << item
  end

  def remove_from_order(item_name)
    selection = @current_items.find { |item| item.name == item_name }
    raise 'No such item in order' if selection.nil?

    @current_items.delete(selection)
  end
end
