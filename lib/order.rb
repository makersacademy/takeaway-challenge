class Order
  attr_reader :basket

  def initialize
    @basket = []
  end

  def add_to_basket(dishes)
    dishes.each { |dish| basket << dish }
    puts "basket = #{basket}"
  end
  
end
