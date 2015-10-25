require './lib/order'
require './lib/submitorder'

class Takeaway

  attr_accessor :menu1, :order1, :name, :price, :menu_item1, :total, :to_mobile, :from_mobile, :message_body, :message, :account_sid, :auth_token, :submitorder1, :quantity

  def initialize
    @menu1 = Menu.new Dish
  end


  def demo
    begin
      puts 'Takeaway Challenge'
      puts '=================='
      puts
      puts 'Select Option:'
      puts 'A - Add dish to menu'
      puts 'B - Display menu so that can make an order'
      puts 'C - Create an order'
      puts 'D - Total an order'
      puts 'E - Submit order'
      puts 'X - End'
      option = gets.chomp
      case option.downcase
      when 'a'
        while true
          puts 'Add dishes name and then price (press return twice to end order )'
          @name = gets.chomp
          break if name == ''
          @price = gets.chomp
          p menu1.add_dish name, price.to_f
        end
      when 'b'
        puts "M E N U"
        puts '======='
        puts menu1.print_dishes
        puts
      when 'c'
        @order1 = Order.new menu1, Menu
        while true
          puts 'Select item number (press return twice to end order)'
          @menu_item1 = gets.chomp
          break if menu_item1 == ''
          puts 'Enter quantiy or return if one'
          @quantity = gets.chomp.to_i
          p !!quantity ? order1.pick_menu_item(menu_item1.to_i,quantity) : order1.pick_menu_item(menu_item1.to_i)
        end
      when 'd'
        puts "T O T A L"
        puts "=========="
        puts "Total cost of current order: £#{order1.total}"
      when 'e'
        puts "Please give mobile number in format +447914245451:"
        @to_mobile = gets.chomp
        @from_mobile = '+441384901121' #+447508059316 other verified number
        @message_body = 'Thank you! Your order was placed and will be delivered before 18:52'
        @message =   {from: from_mobile,
                    to: to_mobile,
                    body: message_body}
        @account_sid = 'ACaa9d88865685ca7e9bdec766b71fa313'
        @auth_token = '7fcdf88aeafb171703682f9e91c42d97'
        p @submitorder1 = SubmitOrder.new(account_sid, auth_token)
        p submitorder1.get order1, order1.total
        while !submitorder1.validated?
          puts "Please give total of order to act as a check e.g. 6.98:"
          @total = gets.chomp.to_i
        end
        p submitorder1.submit message
      when 'x'
        break
      else
        puts 'choose a displayed option'
      end
    end while true
  end
end

takeaway1 = Takeaway.new
takeaway1.demo
