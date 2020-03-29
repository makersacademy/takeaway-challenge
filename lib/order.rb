require_relative 'Menu'
require_relative 'Texter'
class Order
  attr_reader :pricelist
  def initialize(set_menu: Menu)
    @pricelist = set_menu.new
  end
  def place_order
    intro
    notepad = self.take_order
    check_total(notepad)? self.gucci : self.miscalulated
    # this method will be where they pass a hash of dishes and the amount and also the total
    # it will call the check_total method
  end

  def take_order
    dishes = 0
    pad = []
    phone_order = gets.chomp
    while !phone_order.empty? do
      request = phone_order.split(', ')
      volume = request[1].to_i
      pad.push({request[0] => volume})
      dishes += volume
      puts "So that's #{dishes} plates so far"
      phone_order = gets.chomp
    end
    p pad
    pad
  end

  def gucci
    puts "looks good to me! I'll just send you a text with the delivery estimate"
    puts "what number would you like me to send it to?"
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
    # this method sends a text by default but will accept a class that
    # uses the make_the_call method without arguments
    method.new(num: number, text_time: time).make_the_call
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
end
