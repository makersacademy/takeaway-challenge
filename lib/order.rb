#require 'time'
#require 'menu'
#require 'twilio-ruby'
#require 'message_sender'

class Order
  attr_accessor :order, :delivery_time
  def initialize(message_sender = MessageSender.new, menu = Menu.new)
    puts "Welcome to Parrot Pizza Parlour!"
    @order = [{ :item_no => 1, :quantity => 0 },
    { :item_no => 2, :quantity => 0 },
    { :item_no => 3, :quantity => 0 },
    { :item_no => 4, :quantity => 0 },
    { :item_no => 5, :quantity => 0 },
    { :item_no => 6, :quantity => 0 },
    { :item_no => 7, :quantity => 0 },
    { :item_no => 8, :quantity => 0 }]
    @menu = menu
    @total = 0
    @message_sender = message_sender
    @time = Time.new
    @delivery_time = (@time + 1 * 60 * 60).strftime("%I:%M %p")
    puts "Type help for more options"
  end

  def view_order
    fail "No items in order" if @total.zero?

    returnstring = ""
    @order.each do |element|
      next if element[:quantity].zero?

      returnstring << "Item No.#{element[:item_no]}: #{element[:quantity]}x #{@menu.menu[element[:item_no] - 1][:name]} £#{'%.2f' % @menu.menu[element[:item_no] - 1][:price]}\n"
    end
    return returnstring + "Total: £#{'%.2f' % @total}"
  end

  def order_summary_for_text
    returnstring = ""
    @order.each do |element|
      next if element[:quantity].zero?

      returnstring << "#{element[:quantity]}x #{@menu.menu[element[:item_no] - 1][:name]} £#{'%.2f' % @menu.menu[element[:item_no] - 1][:price]}\n"
    end
    return returnstring + ".Total: £#{'%.2f' % @total}"
  end

  def view_menu
    "    #{@menu.menu[0][:item_no]}. #{@menu.menu[0][:name]} £#{'%.2f' % @menu.menu[0][:price]}
    #{@menu.menu[1][:item_no]}. #{@menu.menu[1][:name]} £#{'%.2f' % @menu.menu[1][:price]}
    #{@menu.menu[2][:item_no]}. #{@menu.menu[2][:name]} £#{'%.2f' % @menu.menu[2][:price]}
    #{@menu.menu[3][:item_no]}. #{@menu.menu[3][:name]} £#{'%.2f' % @menu.menu[3][:price]}
    #{@menu.menu[4][:item_no]}. #{@menu.menu[4][:name]} £#{'%.2f' % @menu.menu[4][:price]}
    #{@menu.menu[5][:item_no]}. #{@menu.menu[5][:name]} £#{'%.2f' % @menu.menu[5][:price]}
    #{@menu.menu[6][:item_no]}. #{@menu.menu[6][:name]} £#{'%.2f' % @menu.menu[6][:price]}"
  end

  def add_item(menu_item)
    fail "This item doesn't exist! Why don't you try a Conure Caramelised Onion Pizza - add_item(2)? It's delicious!" if menu_item > 7

    order[menu_item - 1][:quantity] += 1
    @total += @menu.menu[menu_item - 1][:price]
  end

  def delete_item(menu_item)
    fail "No items in order" if @total.zero?
    fail "This item isn't in your order! Did you mean to add it?" if order[menu_item - 1][:quantity].zero?

    order[menu_item - 1][:quantity] -= 1
  end

  def view_total
    fail "No items in order" if @total.zero?

    "£#{'%.2f' % @total}"
  end

  def send_text(number)
    fail "No items in order" if @total.zero?

    puts message = "Thank you for placing your order with Parrot Pizza Parlour. Order number: 2346 containing: #{order_summary_for_text}. Your order will be delivered within one hour, by #{@delivery_time}"
    @message_sender.send_message(number, message)
  end

  def place_order(phone_no)
    send_text(phone_no)
  end

  def help
    "HELP\nview_menu - Display the menu\nadd_item_(Item No.) - Add an item to your order.\nview_order - View your order\ndelete_item_(Item No.) - Delete an item from your order.\nview_total - View the total cost of your order\nplace_order(phone_no.) - Place your order."
  end

  def total
    @total
  end

  private

  def total=(total)
    @total = total
  end

end
