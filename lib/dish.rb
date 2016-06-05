
class Dish
  
  attr_reader :name, :price, :currency
  
  def initialize(name, price, currency = "£")
    @name = name
    @price = price.to_f
    @currency = currency
  end

  def to_s
    "#{ name }: #{ display_price }"
  end
  
  def subtotal_line(quantity = 0)
    to_s + "x#{ quantity }: #{ display_price(subtotal(quantity)) }"
  end

  def subtotal(quantity = 0)
    price * quantity
  end

  private
  
  def display_price(pri = price)
    "#{ currency }#{ pri }"
  end



end


