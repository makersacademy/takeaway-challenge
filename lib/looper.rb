require 'take_away'
class Looper

  def initialize(take_away = TakeAway.new)

  def offers_option
    puts "We are sorry to hear that."
    puts""
    puts "Please write \"start\" to modify your order, or \"cancel\" to cancel it."

    option = gets.chomp
    options = ["cancel","start"]

    while !options.include?option
      puts "Please write, \"start\" or \"cancel\" "
      option = gets.chomp
    end

    option == "start" ? take_away.show_menu : "Your order has been cancelled"

  end

private
  attr_reader :menu


end