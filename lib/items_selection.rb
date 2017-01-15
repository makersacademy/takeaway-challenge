require './lib/menuhash'

class Select_items
  attr_reader :items

  def initialize
    menuhash = Foodbuddy.new
    @items = []
  end

  def input_items
    puts "Please enter menu number of your choice
    e.g. 0 for Greek-style roast fish"
    puts "To finish order, hit return twice"
    id = gets.chomp
    while !id.empty? do
    puts "Thankyou now enter quantity wanted"
    quantity = gets.chomp
    @items << {id: id, quantity: quantity}
    puts "Please enter menu number of your choice
    e.g. 0 for Greek-style roast fish"
    puts "To finish order, hit return twice"
    id = gets.chomp
    end
     @items
  end

end
