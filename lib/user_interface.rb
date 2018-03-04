require_relative 'menu'
require_relative 'order'

class UserInterface
  attr_reader :menu, :order

  def initialize(menu = Menu, order = Order)
    @menu = menu.new
    @order = order.new
  end

  def welcome
    "Welcome to H's Takeaways"
  end

  def display_options
    [
      'Please select an option below to continue',
      '1. To print the menu',
      '2. To start a new order',
      '3. To view current order',
      '4. To confirm order'
    ]
  end

  def display_instructions
    [
      'Please enter the id number of the item in which you want to add.',
      'Once completed, hit return twice to exit the order'
    ]
  end

  def printer(item)
    if item.is_a?(Array)
      item.each { |i| p i }
    else
      p item
    end
  end

  def input
    print '> '
    gets.chomp
  end

  # TODO shorten this method down
  def option(input)
    case input
      when '1'
        'print menu'
        print_menu(@menu.current_menu)
      when '2'
        start_order
        @order.current_order
        'start new order'
      when '3'
        @order.confirm_order unless order_empty?
        'view current order'
      when '4'
        @order.clear_order
        'clear order'
      when '5'
        @order.confirm_order unless order_empty?
        'confirm order'
    end
  end

  def start_order
    printer(display_instructions)

    loop do
      fail "Item is not available" if @menu.current_menu[@selection.to_i].nil?
      @selection = input
      @order.add_item(@menu.current_menu[@selection.to_i])
      print_menu(@order.current_order)
      break if @selection.empty?
    end
  end

  def order_empty?
    @order.current_order.empty?
  end

  def print_menu(list)
    list.each do |item|
      p "#{item[:name]} - £#{'%.2f' % item[:price]} - #{item[:description]}"
    end
  end
end
