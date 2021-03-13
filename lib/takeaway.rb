require_relative 'customer.rb'

class Takeaway
  def initialize
    @menu = TEST_MENU
    @current_order = []
  end

  def display_menu
    display = ['MENU']
    @menu.each_with_index { |item, index| display << menu_line_format(item, index) }
    display.join("\n")
  end

  def display_current_order
    return "You have not selected any items." if @current_order.empty?

    display = ["YOUR ORDER\n"]
    @current_order.each_with_index { |item, index| display << order_line_format(item, index) }
    display.push("\nTOTAL: £#{total_cost(@current_order)}").join("\n")
  end

  def add_to_order(item_number, quantity)
    item_order = { find_menu_item_by_number(item_number) => quantity }
    @current_order << item_order
    item_order
  end

  private

  def find_menu_item_by_number(item_number)
    @menu[item_number - 1].flatten[0]
  end

  def find_price(item_name)
    @menu.each { |item| return item[item_name] if item.has_key?(item_name) }
  end

  def menu_line_format(item, index)
    "#{index + 1}. #{item.flatten[0]}  Price: £#{gbp_format(item.flatten[1])}"
  end

  def order_line_format(item, index)
    number = index + 1
    name = item.flatten[0]
    quantity = item.flatten[1]
    price = find_price(name)
    total = price * quantity

    "#{number}. #{name}  Price: £#{gbp_format(price)}  Qty: #{quantity}  Sub: £#{gbp_format(total)}"
  end

  def gbp_format(amount)
    sprintf('%<gbp>.2f', gbp: amount)
  end

  def total_cost(order)
    total = 0
    order.each do |item|
      name = item.flatten[0]
      quantity = item.flatten[1]
      price = find_price(name)
      total += quantity * price
    end
    gbp_format(total)
  end
end

TEST_MENU = [
  { 'Spicy Edamame' => 4.20 },
  { 'Salt and Chilli Vat Chicken Strips' => 5.20 },
  { 'Tempura Seaweed Fish' => 8.00 },
  { 'Space Whale Sashimi' => 16.00 },
  { 'Venerable Dragon Roll' => 9.80 }
]
