require_relative 'restaurant'

class Basket 
  attr_reader :basket

  def initialize
    @basket = []
  end
  
  def add_item(item)
    @basket << item
  end 

  def show_basket
    basket = {}
    @basket.each do |food_hash| 
      food_hash.each do |item, price| basket[item] = ("£%.2f" % price.to_s )
      end
    end
    basket
  end

  def print_order
    p "#{show_basket}\nTotal: #{total}"
  end

  private

  def total
    total = 0
    @basket.each do |food_hash|
      food_hash.each_value do |price| total += price
      end
    end
    "£%.2f" % total
  end

end