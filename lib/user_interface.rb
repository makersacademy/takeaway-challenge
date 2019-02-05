# frozen_string_literal: true

require_relative 'checks'
require_relative 'order'
require_relative 'print_outs'

# combining all elements into a UI
class UserInterface
  attr_reader :new_order, :check, :print_out, :opening_menu
  attr_reader :asking_for_mobile_no
  attr_accessor :asking_for_item, :asking_for_quantity

  def initialize
    @new_order = Order.new
    @check = Checks.new
    @print_out = PrintOut.new
  end

  def welcome
    @opening_menu = true
    while opening_menu
      system 'clear'
      header
      print_out.what_would_you_like
      check.order_b(new_order, print_out)
      customer_interaction
    end
  end

  def header
    print_out.welcome_message
    new_order.menu.show
    check.order_a(new_order)
    print_out.exit_message
  end

  def customer_interaction
    asking_for_item = true
    while asking_for_item
      user_input = gets.chomp.downcase
      check.first_check_first(user_input, self)
    end
  end

  def quantity(item)
    print_out.how_many_would_you_like
    asking_for_quantity = true
    while asking_for_quantity
      user_input = gets.chomp.downcase
      check.first_check_second(item, user_input, self)
    end
  end

  def add(item, quantity)
    new_order.add(print_out.match_menu_format(item), quantity)
  end

  def checkout?
    if check.basket?(new_order)
      print_out.empty
    else
      checkout
    end
  end

  def checkout
    print_out.what_is_your_mobile_number
    mobile_number
  end

  def mobile_number
    @asking_for_mobile_no = true
    while asking_for_mobile_no
      user_input = gets.chomp.downcase
      check.first_check_third(user_input, self)
    end
  end
end
