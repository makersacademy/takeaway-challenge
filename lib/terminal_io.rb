module TerminalIO

  def welcome
    puts "\nWelcome to Shirt and Thai!\n"
  end

  def basket_title
    puts "\nBASKET:\n"
  end

  def confirm_sms
    puts "You should receive an SMS message shortly confirming your order\n\n"
  end

  def confirm_add_title
    puts "Item(s) successfully added to basket\n"
  end

  def phone_request
    print "Please input your phone number: "
    gets.chomp
  end

end
