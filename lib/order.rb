require_relative 'menu'

class Order
  attr_reader :contents
  def initialize(menu = Menu.new)
    @contents = []
    @menu = menu
  end

  def select(n)
    @contents << @menu.choices[n - 1]
  end

  def place
    @contents = []
    puts "Enter the index and desired quantity per item"
    puts "type 'stop' to finish"
    loop do
      index = gets.chomp
      break if index == "stop"
      quantity = gets.chomp.to_i
      quantity.times{ select(index.to_i) }
      puts "Items added to order. Repeat as necessary"
    end
    puts "All done! :D Simply run again if you wish to redo"
  end

#print Order to check
  def review
    @contents.each_with_index do |item, i|
      puts "#{i + 1}.#{item[:name]}, #{item[:price]}"
    end
    puts price?
  end

#Calculate price
  def price?
    n = 0
    @contents.each do |item|
      n += item[:price]
    end
    n
  end

  def send
    # Twilio functionality here, placeholder code
    puts "Order sent! Expect before 18:52, thank you for ordering with us!"
    @contents
  end
end
