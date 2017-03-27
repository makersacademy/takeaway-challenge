class Words

  def self.greeting
    puts "Greetings, Welcome to Ruby Sushi!"
  end

  def self.order_prompt
    puts "What would you like to order? Enter 'done' when you are happy with your selection"
  end

  def self.dish_selection_prompt
    print "Dish: "
  end

  def self.quantity_selection_prompt
    print "Quantity: "
  end

  def self.not_a_dish
    puts "Input is not a dish. Try again:"
  end

  def self.invalid_input
    puts "Input invalid: please select 'y' for yes or 'n' for no"
  end

  def self.thankyou_message
    puts "Thank you for visiting Ruby Sushi! We have sent a confirmation text for your order."
  end

  def self.incorrect_order_options
    puts "Press 'n' to start a new order or 'q' to quit"
  end

  def self.invalid_yesno_input
    puts "Input invalid: Press 'n' to start a new order or 'q' to quit"
  end

  def self.exit_message
    "Thank you for visiting Ruby Sushi!"
  end

  def self.order_heading
    puts "--------------"
    puts "Your order:"
    puts "--------------"
  end

  def self.breakdown_header
      puts "--------------"
      puts "Your order:"
      puts "--------------"
  end

  def self.breakdown_correct?
      puts "Is this correct? (y/n)"
  end

  def self.menu_header
    puts "--------------"
    puts "Todays's Menu:"
    puts "--------------"
  end

  def self.line
    puts "--------------"
  end
end
