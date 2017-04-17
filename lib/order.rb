require_relative 'text'

class Order

  MENU = {         "Chop Suey" => 7.00,
                     "Dim Sum" => 6.50,
              "Prawn Crackers" => 2.00,
              "Duck Chow Mein" => 7.50,
                  "Spare ribs" => 9.00,
             "Fortune Cookies" => 3.00 }

  def view_menu
   MENU.to_s
  end

  def create_order(*item_quantity, expected_cost)
    if adder(item_quantity) == expected_cost
      print_receipt(item_quantity, expected_cost)
      send_text(expected_cost)
      true
    end
  end

  def adder(item_quantity)
    total_cost = 0
    item_quantity.each do |item, quantity|
      total_cost += MENU[item]*quantity
    end
    total_cost
  end

  def print_receipt(item_quantity, cost)
    receipt = ''
    receipt << "Thank you for ordering\nYou ordered:\n"
    item_quantity.each do |item, quantity|
      receipt << "Item: #{item}, total cost #{"%.2f" % (MENU[item]*quantity)}\n"
    end
    receipt << "Total cost: #{"%.2f" % cost}"
    receipt
  end

  def send_text(cost)
    puts "Can you please enter your phone number?"
    number = gets.chomp
    time = Time.new
    time = time + 3600
    message = "The total cost will be £#{"%.2f" % cost}. It will arrive before #{time.strftime("%I:%M%p")}"
    Text.make_text(number,message)
  end


end
