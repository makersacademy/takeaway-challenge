class Basket

  attr_reader :basket, :total

  def initialize()
    @basket = []
  end

  def add(item,number_of_item = 1)
    array = []
    number_of_item.times do
      array.push(item)
    end
    @basket.push(array)
  end

  def total
    total = 0
    @basket.each do |item|
      total += item[0].price * item.length
    end
    total
  end

  def list
    p 'hello'
  end

end
