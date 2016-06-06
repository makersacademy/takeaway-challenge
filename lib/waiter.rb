require_relative 'cashier'
class Waiter

  def initialize(cashier = Cashier.new)
    @cashier = cashier
    @selection = {}

  end

  def take_order(menu)
    puts "What would you like to order?"
    response = gets.chomp

      while response != "finalize order"

        if !menu.include?response.capitalize
          puts "Sorry we do not offer #{response}, would you like anything else from our menu?"
          puts 'Or write "finalize order" to proceed with the order'
          response = gets.chomp
        else
          puts "How many #{response} portions would you like?"
          numbers = gets.chomp
          puts "Please, write a number" if numbers.to_i != numbers
          numbers = gets.chomp
          @selection[response.capitalize] = numbers.to_i
          puts "Would you like to order anything else?"
          puts "Write \"finalize order \" to submit your final order"
          response = gets.chomp
        end

      end
  cashier.checks_order(menu, @selection)
  end

  private

  attr_reader :cashier

end

