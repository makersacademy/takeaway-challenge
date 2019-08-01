class Takeout
  attr_reader :list

  def initialize(list = {})
    @list = list
  end

  def select
    


  def price(order)
    order.each{|item, value| list[item] }
  end
end
