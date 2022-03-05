class Order
  attr_reader :current_items

  def initialize
    @current_items = []
  end

  def add_to_order(item_number)
    @current_items << item_number
  end

  def remove_from_order(item_name)
    selection = @current_items.find { |item| item.name == item_number }
    raise 'No such item in order' if selection.nil?

    @current_items.delete(selection)
  end

  def list_order
    @current_items.each do |item|
      puts "#{item.name} - #{item.price}"
    end
  end

  def order_total_price
    @current_items.map { |item| item.price }.sum
  end

  def confirm_order
    list_order
    puts order_total_price
    
  end
end
