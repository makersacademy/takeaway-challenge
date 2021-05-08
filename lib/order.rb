require_relative 'bhaji'
require_relative 'rice'
require_relative 'korma'
require_relative 'jalfrezi'
require_relative 'naan'
require_relative 'chai'

class Order  
  attr_reader :order

  def initialize(bhaji = Bhaji.new, rice = Rice.new, korma = Korma.new, jalfrezi = Jalfrezi.new,
     naan = Naan.new, chai = Chai.new)
    @bhaji = bhaji
    @rice = rice
    @korma = korma 
    @jalfrezi = jalfrezi
    @naan = naan
    @chai = chai 
    @order = []
  end 

  def menu
    "#{@bhaji.name} £#{@bhaji.price},\ #{@rice.name} £#{@rice.price},"\
    " #{@korma.name} £#{@korma.price},\ #{@jalfrezi.name} £#{@jalfrezi.price},"\
    " #{@naan.name} £#{@naan.price}, #{@chai.name} £#{@chai.price}"
  end 

  def select_food
    while true do 
      puts "What would you like to order? When complete enter 'done'" 
      user_input = gets.chomp 
      @order.push(@bhaji.name) if user_input.downcase == "bhaji"
      @order.push(@rice.name) if user_input.downcase == "rice"
      @order.push(@korma.name) if user_input.downcase == "korma"
      @order.push(@jalfrezi.name) if user_input.downcase == "jalfrezi"
      @order.push(@naan.name) if user_input.downcase == "naan"
      @order.push(@chai.name) if user_input.downcase == "chai"
      break if user_input.downcase == "done"
    end
    @order
  end

end
