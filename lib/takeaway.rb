class Takeaway
  def initialize(twilio_manager, menu, order_template)
    @twilio_manager = twilio_manager
    @menu = menu
    @order_template = order_template
    @active_order = nil
  end

  def interactive_menu
    loop do
      print_options
      selection = gets.chomp
      p selection
      process(selection)
    end
  end

  def send_confirmation_text
    @twilio_manager.send_sms(confirmation_string)
  end
  
  private
  
  def print_options
    puts [
      '1. View the Menu',
      '2. Select Items to Order',
      '3. View Current Order',
      '9. Exit program'
    ]
  end

  def process(selection)
    case selection
    when '1'
      @menu.list_available_dishes
    when '2'
      current_order.select_items(@menu)
    when '3'
      current_order.list_order
    when '9'
      quit_program
    else
      puts "Invalid selection"
    end
  end

  def quit_program
    puts "Exiting program..."
    exit # Needs to be commented out for running tests
  end

  def current_order
    @active_order ||= @order_template.dup
  end

  # def current_order
  #   @active_order = @active_order.nil? ? @order_template.dup : @active_order
  # end

  def confirmation_string
    "Thank you! Your order was placed and will be delivered before #{time_in_an_hour}"
  end

  def time_in_an_hour
    current_time = Time.new
    "#{current_time.hour + 1}:#{current_time.min}"
  end
end
