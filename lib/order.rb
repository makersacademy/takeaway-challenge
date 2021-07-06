require_relative 'Menu'
require_relative 'Texter'
class Order
  attr_reader :pricelist

  def initialize(set_menu: Menu)
    @pricelist = set_menu.new
  end
  def place_order
    intro
    notepad = take_order
    check_total(notepad)? gucci : miscalulated
  end

  protected

  def take_order(dishes: 0, pad: [])
    phone_order = gets.chomp
    while !phone_order.empty? do
      request = phone_order.split(', ')
      volume = request[1].to_i
      pad.push({request[0] => volume})
      dishes += volume
      puts "So that's #{dishes} plates so far"
      phone_order = gets.chomp
    end
    pad
  end

  def gucci
    puts "looks good to me! I'll just send you a text with the delivery estimate"
    puts "what number would you like me to send it to?"
    puts "please input your number plus country code, e.g. 44789085764"
    number = gets.chomp
    latest_delivery = Time.new + 1800
    self.send_confirmation(number: number, time: latest_delivery)
  end

  def miscalulated
     puts "nah sorry bad math there, do you want to try again?"
     puts "Y[es]/N[o]?"
     choice = gets.chomp
     if choice == "Y"
       place_order
     else
       puts "no worries then have a great day."
     end
  end

  def intro
    puts "Please place your order by typing the name of each dish followed by a comma and the quantity per dish"
    puts "once you've given the full order let us know roughly how much you think it should be, we'll check and then take your number."
    puts "for example, 'Carbonara, 2'\n \n 14'"
  end

  def send_confirmation(method:Texter, number:, time:)
     while check_number(number) do
       puts "ah that number doesn't have the right number of digits, please re-enter"
       number = gets.chomp
     end
    method.new(num: number, text_time: time).make_the_call
  end
  def check_number(number)
    num_digits(number) != 11
  end
  def num_digits(num)
    Math.log10(num).to_i + 1
  end

  def check_total(array_of_hashes)
    puts "right I think that's everything, how much do you reckon it'll be?"
    estimate = gets.chomp.to_i
    puts "£#{estimate}? Let me just double check that, one moment"
    recommended_retail = self.calculator(array_of_hashes)
    recommended_retail == estimate.to_i
  end

  def calculator(array_of_hashes)
    # this method will calculate the total of the dishes passed.
    total = 0
    array_of_hashes.each do |hash_of_dishes|
      key = hash_of_dishes.keys[0]
      value = hash_of_dishes[key]
       total += @pricelist.specials[position_of(key)].price * value
    end
    total
  end

  def position_of(title)
    dish_in_question = @pricelist.specials.filter { |f| f.name == title }
    @pricelist.specials.index(dish_in_question[0])
  end

  def check_input?(arr)
    two_long?(arr) & on_the_menu?(arr[0])
  end

  def two_long?(arr)
    arr.length == 2
  end

  def on_the_menu?(item)
  end
end
