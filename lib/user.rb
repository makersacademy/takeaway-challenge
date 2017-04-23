require_relative 'text'
require_relative 'menu'
require_relative 'order'
require_relative 'adder'
require_relative 'current_order'
require_relative 'total'

class User

  attr_accessor :newmenu, :add, :order, :sms, :menu

  def initialize
    $menu = Menu.new
    $newmenu = $menu.menu
    $add = Adder.new
    $order = Order.new
    $sms = Text.new
    $cash = Total.new
  end

  def header
    puts ""
    puts ""
    puts ""
    $menu.show
  end

  def interactive_menu
    loop do
      commands
      options($stdin.gets.chomp)
    end
  end

  def commands
    puts "Type what would you like to do"
    puts "'add' 'menu' 'current order' 'total' 'place' 'exit'"
  end

  def options(key)
    case key
      when 'menu'
        $menu.show
      when 'add'
        $order.start unless $order.running?
        $add.choice
      when 'current order'
        $order.start unless $order.running?
        puts "Nothing added yet." if $current_order.empty?
        $current.show
      when 'total'
        $cash.calculate_total
        puts "£#{$total}0"
      when 'place'
        puts "Nothing added yet." if $current_order.empty?
        puts "Are you sure?"
        print "Y/N: "
        answer = gets.chomp
        if answer == 'y'
          $sms.send
        else
          interactive_menu
        end
      when 'exit'
        exit
      else
        puts "I don't know what you meant, try again"
      end
    end
end
