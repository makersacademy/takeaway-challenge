require_relative 'twilio'

class Takeaway
  attr_reader :basket, :total
  def initialize(messenger = Messenger.new)
    @dishes = []
    @basket = []
    @total = total
    @messenger = messenger
    dishes
  end

  def dishes
    @dishes.push({dish: "Burger", price: 2.50},
                 {dish: "Chips", price: 1.00},
                 {dish: "Savaloy", price: 2.00},
                 {dish: "Cod", price: 4.50},
                 {dish: "Coke", price: 1.50})
  end

  def add_to_basket
      puts "What would you like to add to basket?: "
      dishchoice = gets.chomp
      case dishchoice
      when "burger"
        @basket << @dishes[0]
        puts "Added to Basket!"
      when "chips"
        @basket << @dishes[1]
        puts "Added to Basket!"
      when "savaloy"
        @basket << @dishes[2]
        puts "Added to Basket!"
      when "cod"
        @basket << @dishes[3]
        puts "Added to Basket!"
      when "coke"
        @basket << @dishes[4]
        puts "Added to Basket!"
      else
        puts "Not on the menu"
      end
  end

  def print_menu
    @dishes.each do |dish|
      puts "#{dish[:dish]} - £#{dish[:price]}0"
    end
  end

  def print_basket
    @basket.each do |dish|
      puts "#{dish[:dish]} - £#{dish[:price]}0"
    end
    total = @basket.inject(0) {|sum, hash| sum + hash[:price]}
    puts "Your total is: £#{total}0"
  end

 def checkout
   puts "Order has been placed, you will receive a SMS shortly."
   messenge_sent
 end
end
