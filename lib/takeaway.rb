require 'twilio-ruby'

## This class understands what's available to eat, how to order, manages
## the user interface and sends the confirmation text message
class Takeaway
  def initialize
    welcome
    print_menu
    make_selection
    display_order
    confirm_order
  end

  def welcome
    puts '--------------------------------------------'
    puts 'Welcome to the PizzaPizzaPizza Delivery app!'
    puts 'We love pizza so much we named it thrice!'
    puts 'Here is the menu for today:'
    puts ''
  end

  def print_menu
    @menu = [{ dish: 'Margherita      ', price: 7.5 },
             { dish: 'American Hot    ', price: 9 },
             { dish: 'Pepperoni       ', price: 8.5 },
             { dish: 'Quattro Formaggi', price: 8 },
             { dish: 'Mushroom        ', price: 8 },
             { dish: 'Garlic Bread    ', price: 3.5 }]
    @menu.each_with_index do |line, i|
      puts "#{i+1}. #{line[:dish]}" + " £#{'%.2f' % line[:price]}"
    end
    puts ''
    puts 'What would you like to order for delivery?'
    puts 'Select by number, then type enter to finish:'
  end

  def make_selection
    @order = []
    choice = ' '
    while choice != ''
      choice = gets.chomp
      @order << @menu[choice.to_i-1]
    end
    @order.pop
  end

  def display_order
    puts '--------------------------------------------'
    puts 'You have ordered:'
    @order.each_with_index do |line, i|
      puts "#{i+1}. #{line[:dish]}" + " £#{'%.2f' % line[:price]}"
    end
    puts ''
    @price = []
    @order.each do |line|
      @price << line[:price]
    end
    puts 'Total cost:         £' + '%.2f' % @price.inject(:+)
    puts '--------------------------------------------'
    puts 'Is that correct?'
    puts ''
    puts 'Type Y to complete the transaction:'
  end

  def confirm_order
    x = gets.chomp
    if x.downcase == 'y'
      complete
    else
      made_mistake
    end
  end

  def made_mistake
    puts ''
    puts 'Made a mistake? Never mind, try again:'
    print_menu
    make_selection
    display_order
    confirm_order
  end

  def complete
    puts ''
    puts 'Order complete. Enjoy your pizza! Nom...'
    puts '(plus, look out for the confirmation text!)'
    puts '--------------------------------------------'
    send_sms
  end

  def send_sms
    in_an_hour = (Time.now + 3600).strftime('%I:%M%p')
    account_sid = 'ACcd6959bd8f7d0a5230d48cefa40a25c7'
    auth_token = 'ce30c52fbbb1c81a265b577a32d02259'

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create(
      from: '+441254790281',
      to: '+447543827342',
      body: 'Thank you! Your order was placed and will be delivered before ' + in_an_hour
    )
  end
end

Takeaway.new
