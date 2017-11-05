require_relative 'dish'

class Order

attr_accessor :basket, :total, :status

def initialize
  @basket = Hash.new { |hash, key| hash[key] = 0 }
  @total = 0
  @status = :unfinalised
end

def add_to_basket(dish, quantity = 1)
  @basket[dish] += quantity
  @total +=dish.price.to_i * quantity
end

def basket_summary
  @basket.each_with_index do | (key,value), index|
    print "#{index+1}. #{key.name.upcase} -- Price #{key.price}$ -- Quantity #{value}\n"
  end
end

def complete_order
  @status = :finalised
end

end
