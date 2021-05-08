require_relative 'bhaji'
require_relative 'rice'
require_relative 'korma'
require_relative 'jalfrezi'
require_relative 'naan'
require_relative 'chai'

class Order  
  def initialize(bhaji = Bhaji.new, rice = Rice.new, korma = Korma.new, jalfrezi = Jalfrezi.new,
     naan = Naan.new, chai = Chai.new)
    @bhaji = bhaji
    @rice = rice
    @korma = korma 
    @jalfrezi = jalfrezi
    @naan = naan
    @chai = chai 
  end 

  def menu
    "#{@bhaji.name} £#{@bhaji.price},\ #{@rice.name} £#{@rice.price},"\
    " #{@korma.name} £#{@korma.price},\ #{@jalfrezi.name} £#{@jalfrezi.price},"\
    " #{@naan.name} £#{@naan.price}, #{@chai.name} £#{@chai.price}"
  end 

end
