require_relative 'customer.rb'

class TakeAway

  def initialize
    @name = E£
  end

  def launch!
    introduction
    # placing order
    conclusion
  end

  def introduction
    puts "\n<< Welcome to #{name.strip.downcase.capitalize}! >>\n"
    puts "\n<< Please have a look at the menu below and place your order.\n\n"
  end

  def conclusion
    puts "\n<< Thank you for placing your order! >>\n"
    puts "\n<< You will shortly receive a text message confirmation. >>\n"
    puts "\n<< Bon Appetit!>>\n"
  end
end

t = TakeAway.new("bella   ")
t.launch!
