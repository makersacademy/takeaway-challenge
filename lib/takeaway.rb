require_relative 'customer.rb'

class Takeaway
  def initialize
    @menu = TEST_MENU
    @current_order = []
  end

  attr_accessor :current_order

  def display_menu
    display_menu_format
  end

  def display_current_order
    return "You have not selected any items." if @current_order.empty?

    display_order_format
  end

  def add_to_order(item_number, quantity)
    item_order = { find_menu_item_by_number(item_number) => quantity }
    @current_order << item_order
    item_order
  end

  def remove_from_order(item_number, quantity)
    return "Cannot edit order by a negative number." if quantity < 1

    name = find_menu_item_by_number(item_number)
    @current_order.each_with_index do |item, index|
      if item.has_key?(name)
        item[name] -= quantity
        @current_order.delete_at(index) if item[name] <= 0
      end
    end
    "Removed #{quantity} #{name} from order."
  end

  def checkout(customer)
    display_current_order
    address = "#{customer.address[:address]}, #{customer.address[:post_code]}"
    number = customer.number
    checkout_message(address, number)
  end

  def place_order(_customer)
    text_confirmation
    order_message
  end

  def text_confirmation
    delivery_time = (Time.now + 60 * 60).strftime "%H:%M"
    "Thank you! Your order was placed and will be delivered by #{delivery_time}"
  end

private

  def find_menu_item_by_number(item_number)
    @menu[item_number - 1].flatten[0]
  end

  def find_price(item_name)
    @menu.each { |item| return item[item_name] if item.has_key?(item_name) }
  end

  def display_menu_format
    display = ['MENU']
    @menu.each_with_index { |item, index| display << menu_line_format(item, index) }
    display.join("\n")
  end

  def menu_line_format(item, index)
    "#{index + 1}. #{item.flatten[0]}  Price: £#{gbp_format(item.flatten[1])}"
  end

  def display_order_format
    display = ["YOUR ORDER\n"]
    @current_order.each_with_index { |item, index| display << order_line_format(item, index) }
    display.push("\nTOTAL: £#{total_cost(@current_order)}").join("\n")
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

  def checkout_message(address, number)
    display = "Your order is £#{total_cost(@current_order)}.\nYour address is: #{address}\n"
    display << "Your number is: #{number}\n\nPlease press PLACE ORDER to confirm."
  end

  def order_message
    "Payment Confirmed.\nOrder placed.\nConfirmation test issued."
  end
end

TEST_MENU = [
  { 'Spicy Edamame' => 4.20 },
  { 'Salt and Chilli Vat Chicken Strips' => 5.20 },
  { 'Tempura Seaweed Fish' => 8.00 },
  { 'Space Whale Sashimi' => 16.00 },
  { 'Venerable Dragon Roll' => 9.80 }
]

test_takeaway = Takeaway.new

test_takeaway.add_to_order(2, 2)
test_takeaway.add_to_order(4, 2)
test_takeaway.add_to_order(5, 1)

puts test_takeaway.current_order.inspect

test_takeaway.remove_from_order(4, 1)

puts test_takeaway.current_order.inspect
