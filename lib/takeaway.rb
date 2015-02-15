require 'twilio-ruby'
require 'colorize'

class Takeaway

  attr_accessor :menu, :order_information, :takeaway

  def initialize(type=:makeaway)
    @takeaway = type.downcase
    @menu = menu_types[takeaway]
    @order_information = {}
  end

  def menu_types
    menu_types = { makeaway: {  'Peanut Butter Sandwich' => 1.12,
                                'Bowl of Cornflakes'     => 0.99,
                                'Banana'                 => 0.10,
                                'Apple'                  => 0.15,
                                'Croissant'              => 0.67,
                                'Tea'                    => 0.70,
                                'Coffee'                 => 0.80 },

                   nandos:   {  'Half Chicken'           => 9.99,
                                'Quarter Chicken'        => 7.99,
                                'Whole Chicken'          => 13.99,
                                'Sweet Potato Mash'      => 2.99,
                                'Garlic Bread'           => 2.99,
                                'Olives'                 => 1.49 },

                   luigis:   {  'Pepperoni Pizza'        => 9.99,
                                'Spaghetti Bolognease'   => 8.99,
                                'Lasagne'                => 7.99,
                                'Salad'                  => 2.99,
                                'Gnocchi'                => 9.99 }
                  } 
  end

  def show_menu
    spacing = 32
    menu.each do |menu_item, price|
      print "#{menu_item} ".red; 
      print "." * (spacing - menu_item.length)
      print " £#{price}\n"
      sleep(1)
    end
  end

  def take_call_from(customer)
    puts "Hello #{takeaway.capitalize}, would you like to place an order?"; sleep(1)
    puts 'Type y for yes and n for no, then hit enter...'
    answer = gets.chomp
    answer = nil if answer != 'y'
    take_order if answer == 'y' 
    end_call if answer == nil
  end

  def take_order
    show_menu
    puts 'What would you like to order?'
    dish = gets.chomp
    puts 'How many would you like?'
    quantity = gets.chomp.to_i
    order_information[[quantity, dish]] = menu[dish]
    repeat_order
    confirm_order
    end_call
  end

  def repeat_order
    order_total = 0
    order_information.each do |information, price|
      puts "So that's #{information[0]} x #{information[1]} at £#{price} each."
      puts "For a total of £#{price * information[0]}"
      order_total = order_total + (2 * price)
    end
  end

  def get_time
    time = Time.new
      if time.min == (0..9)
        output = (time.hour + 1).to_s + ':0' + time.min.to_s
      else
        output = (time.hour + 1).to_s + ':' + time.min.to_s
      end
    output
  end

  def confirm_order
    puts 'Would you like to place this order'
    puts 'Enter y for Yes and n to start again, then hit Enter...'
    input = gets.chomp
    send_text if input == 'y'
    
  end

  def end_call
    puts 'You will receive a confirmation text shortly.'; sleep(1)
    puts "Thanks for calling #{takeaway.capitalize}, have a nice day!"
  end

  def send_text
    account_sid = 'AC44dcaf48c2de912fea75b0e472225c50'
    auth_token  =  'e0e7f38e8db606f71a8a73fbab90169b'

    @client = Twilio::REST::Client.new account_sid, auth_token
    @message = @client.account.messages.create({:to   => '07737932693',
                                                :from => '+441173251558',
                                                :body => "Thank you! Your order was placed and will be delivered before #{get_time}"})
  end

end