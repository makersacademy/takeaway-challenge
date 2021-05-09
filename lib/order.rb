require_relative 'bhaji'
require_relative 'rice'
require_relative 'korma'
require_relative 'jalfrezi'
require_relative 'naan'
require_relative 'chai'

class Order  
  attr_reader :order, :bhaji, :rice, :korma, :jalfrezi, :naan, :chai 
  attr_accessor :sum

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

  def total
    sum = 0
    order.each { |dish| 
    if dish == "chai" 
      sum += 2
    elsif dish == "naan"
      sum += 4
    elsif dish == "korma"
      sum += 8
    elsif dish == "jalfrezi"
      sum += 10
    elsif dish == "rice"
      sum += 2
    elsif dish == "bhaji"
      sum += 4
    end
  }
  end
end
