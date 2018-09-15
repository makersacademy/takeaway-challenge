 class Test
  attr_reader :order_list
  def initialize
    @menu = [{dish: "pelmeni", price: 6.99, quantity: 3}, 
      {dish: "borscht", price: 5.99, quantity: 6}, 
      {dish: "tvarog", price: 3.99, quantity: 5}] 
    @order_list = []
  end

  def order(food, quantity = 1)
    @menu.each do |hash|
      hash.each do |key, value|
        if key == :dish && food == value
            @order_list << [value, quantity]
        end
      end
    end
    "#{quantity}x - #{food.capitalize} added to basket."
  end

end