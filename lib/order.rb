require_relative 'takeaway'

class Order
  attr_reader :basket, :subtotal, :total, :menu

  def initialize
    @basket = {}
    @subtotal = []
    @menu = {"fish and chips" => 4.34,
             "chicken korma" => 3.56,
             "sausges and mash" => 5.46,
             "cheese pizza" => 2.87,
             "pepperoni pizza" => 3.93}
  end

  def add_to_basket(selection)
    basket.merge!(selection)
    current_price(basket)
  end

  def total
    total_price
  end

  private

  def current_price(basket)
    basket.each do |item, count|
      price = count * @menu[item]
      subtotal << price
    end
  end

  def total_price
    @total = @subtotal.reduce(0, :+).round(2)
  end

end
