require_relative 'checks'
require_relative 'order'
require_relative 'print_outs'

class UserInterface
  attr_reader :new_order, :check, :print_out, :opening_menu
  attr_reader :asking_for_item, :asking_for_quantity, :asking_for_mobile_no
  
  def initialize
    @new_order = Order.new
    @check = Checks.new
    @print_out = PrintOut.new
  end
  
  def welcome
    @opening_menu = true
    while opening_menu
      system 'clear'; header
      print_out.what_would_you_like
      check.order_b(new_order, print_out); customer_interaction
    end
  end

  def header
    print_out.welcome_message; new_order.menu.show
    check.order_a(new_order); print_out.exit_message
  end

  def customer_interaction
    @asking_for_item = true
    while asking_for_item
      user_input = gets.chomp.downcase
      first_check_first(user_input)
    end
  end

  def first_check_first(user_input)
    case user_input
      when 'exit' then print_out.close
      when 'cancel' then @asking_for_item = false
      when 'checkout' then checkout?
      else second_check_first(user_input)
    end
  end

  def second_check_first(user_input)
    if check.menu?(new_order, print_out, user_input)
      print_out.oops
    else
      quantity(user_input); @asking_for_item = false
    end
  end

  def quantity(item)
    print_out.how_many_would_you_like
    @asking_for_quantity = true
    while asking_for_quantity
      user_input = gets.chomp.downcase
      first_check_second(item, user_input)
    end
  end

  def first_check_second(item, user_input)
    case user_input
      when 'exit' then print_out.close
      when 'cancel' then @asking_for_quantity = false
      when '0', '' then print_out.you_entered_zero
      else second_check_second(item, user_input)
    end
  end

  def second_check_second(item, user_input)
    if check.not_a_no?(user_input)
      print_out.oops
    else
      add(item, user_input.to_i); @asking_for_quantity = false
    end
  end
    
  def add(item, quantity)
    new_order.add(print_out.match_menu_format(item), quantity)
  end

  def checkout?
    if check.basket?(new_order)
      print_out.empty
    else
      checkout; @asking_for_item = false
    end
  end

  def checkout
    print_out.what_is_your_mobile_number; mobile_number
  end

  def mobile_number
    @asking_for_mobile_no = true
    while asking_for_mobile_no
      user_input = gets.chomp.downcase
      first_check_third(user_input)
    end
  end

  def first_check_third(user_input)
    case user_input
      when 'exit' then print_out.close
      when 'cancel' then @asking_for_mobile_no = false
      else second_check_third(user_input)
    end
  end

  def second_check_third(user_input)
    if check.mobile?(user_input) 
      print_out.oops
    else
      new_order.checkout(user_input.to_i); print_out.close
    end
  end
end
