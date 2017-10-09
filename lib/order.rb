require './order_item'
class Order
  attr_reader :order_items

  def initialize
    @order_items = {}
  end

  def confirm_item_quantity(description, unit_price)
    puts "You selected '#{description}' - how many would you like?"
    quantity = gets.chomp.to_i
    add_food_item(description, quantity, unit_price) if quantity > 0
  end

  def total_value
    @order_items.inject(0) { |sum, (_k, v)| sum + v.value }
  end

  def show
    "Your order:\n#{order_summary}"
  end

private

  def add_food_item(description, quantity, unit_price)
    order_item = OrderItem.new(description, unit_price) unless
        order_items.has_key?(description)
    order_item = @order_items[description] if order_items.has_key?(description)
    order_item.alter_quantity quantity
    @order_items[description] = order_item
  end

  def order_summary
    return " - nothing ordered yet -" if total_value.zero?
    # @order_items.map { |sum, (_k, v)| sum + v.value }
    output = []
    @order_items.map do |_k, v|
      output << "#{v.description}\t * #{v.quantity}\t#{v.value}" unless v.value.zero?
    end
    output.join("\n")
  end
end
