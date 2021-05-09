require_relative 'bhaji'
require_relative 'rice'
require_relative 'korma'
require_relative 'jalfrezi'
require_relative 'naan'
require_relative 'chai'

class Order  
  attr_reader :order, :bhaji, :rice, :korma, :jalfrezi, :naan, :chai

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

  def select_food(dish)
    @order << dish
  end





=begin
  def total
    total = 0
    @order.each { |dish| total += :dish.price "#{:dish.name} - £#{:dish.price}"  }
    "Your total is £#{total}."
  end
=end
end
