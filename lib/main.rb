class Main
  def initialize
    @takeaway = Takeaway.new
  end

  def run
    print_line_break

    print_greeting
    print_menu
    order = take_user_order
    return if request_confirmation == 'n'

    send_sms(request_sms_number, order.to_string)
  end

  private

  def print_greeting
    puts "Please select your desired items by inputting their numbers, separated by commas. Hit enter when you're done."
    print_line_break
  end

  def print_menu
    puts "Menu:\n"
    puts @takeaway.menu.line_items_string
    print_line_break
  end

  def take_user_order
    user_selection = gets.chomp.tr(" ", "").split(',')
    order = @takeaway.order(user_selection.map(&:to_i))

    print_line_break
    puts "You ordered:", order.to_string
    print_line_break
    order
  end

  def request_confirmation
    puts "Enter Y to place order, or N to exit"
    gets.chomp.downcase
  end

  def request_sms_number
    puts "Please enter a valid mobile number to receive an SMS confirmation"
    number = gets.chomp
    print_line_break
    number
  end

  def send_sms(recipient, body)
    @takeaway.send_sms_confirmation(to: recipient, body: body)
    print_sms_confirmation(recipient)
  end

  def print_sms_confirmation(number)
    puts "You should receive an SMS confirmation to #{number} in the coming minutes"
  end

  def print_line_break
    puts ''
  end
end

Main.new.run

