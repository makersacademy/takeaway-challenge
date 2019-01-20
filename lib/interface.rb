require_relative 'order_handler'
require_relative 'reassurer'

# Shows user information and gets user input
class Interface
  def initialize(handler = OrderHandler.new)
    @action = nil
    @handler = handler
    @chosen_dish = nil
    @chosen_quantity = nil
  end

  def launch
    until action == '4'
      show_action_menu
      @action = gets.chomp
      do_requested
    end
  end

  private

  attr_reader :action, :handler, :chosen_dish, :chosen_quantity

  # Indicates actionable user input
  def show_action_menu
    puts '1. See list of dishes'
    puts '2. Select dish'
    puts '3. Verify order'
    puts '4. Complete order'
  end

  # Calls action appropriate to user request
  def do_requested
    case action
    when '1'
      show_list
    when '2'
      action_request_to_select_dish
    when '3'
      verify_order
    when '4'
      finalize_order
    end
  end

  # Takes an array of arrays and prints a formatted
  # string from each subarray
  def show_list
    handler.see_list.each { |pair|
      puts "#{pair.first} - £#{pair.last}"
    }
  end

  # Prompt user input and act upon user choice
  def action_request_to_select_dish
    puts "Type dish name and quantity (if more than 1)"
    set_choice
    send_choice
    reset_attributes
  end

  # Display order information
  def verify_order
    handler.order.each { |item|
      puts "#{item[0]} quantity: #{item[1]} total: £#{item[2]}"
    }
  end

  # Calls reassure on new Reassurer object
  def finalize_order
    puts Reassurer.new.reassure
  end

  # Set instance variables to user choice input
  def set_choice
    choice = gets.chomp
    @chosen_dish = choice.match(/\w+/)[0]
    @chosen_quantity = choice.match(/\d+/)[0].to_i if choice.match?(/\d+/)
  end

  # Send user's choice(s) to order handler
  def send_choice
    if chosen_quantity
      handler.select_dish(chosen_dish, chosen_quantity)
    else
      handler.select_dish(chosen_dish)
    end
  end

  # Reset user choice instance variables
  def reset_attributes
    @chosen_dish, @chosen_quantity = nil, nil
  end
end
