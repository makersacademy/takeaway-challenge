class Takeaway 
  attr_reader :basket, :menu, :grand_total
    
  def initialize 
    @menu = {"chow mein": 1.99, "chicken balls": 2.00, "duck pancakes": 1.00}
    @basket = []
    @grand_total = 0.00
  end
    
  def read_menu
    @menu
  end
 
  def order(dish, quantity=1 )
    @basket << {:dish => dish, :quantity => quantity, :total => total(dish, quantity)}
    "You have added #{dish} x #{quantity}"
  end
 
  def total(dish, quantity)
    subtotal = @menu[dish.to_sym] * quantity
    @grand_total += subtotal
    subtotal
  end

  def reconcile 
    item_total = 0.00
    @basket.each { |item| item_total += item[:total] }
      if item_total != @grand_total
        raise "grand_total does not equal total of items"
      else
       "Thank you your order will be delivered before 6pm"
      end
  end
 
end
