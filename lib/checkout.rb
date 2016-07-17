class Checkout
  def do
    thank_you_message
    send_message(get_number)
  end

  def thank_you_message
    "Thank you for your order!"
  end

  def get_number
    puts "Please enter your phone number for a confirmation text"
    gets.chomp
  end

  def send_message(number)
  puts  "sending message to #{number}"
  end
end
