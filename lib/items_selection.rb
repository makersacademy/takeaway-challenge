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
    q = gets.chomp
    @items << {id: id, q: q}
    puts "Please enter menu number of your choice
    e.g. 0 for Greek-style roast fish"
    puts "To finish order, hit return twice"
    id = gets.chomp
    end
     @items
  end

end
