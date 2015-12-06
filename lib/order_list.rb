require_relative 'dish_list'

class OrderList

  def initialize(dish_list=DishList.new)
    @dish_list = dish_list
  end


  def prices
    @dish_list.prices
  end

  def place_order(total=nil,hash_quantities)
  fail 'An ordered dish is unavailable' unless ordered_dishes_available?(hash_quantities)
  fail 'Total does not match sum of dishes in order' unless total == nil || total == dish_total(hash_quantities)
  end

  private

  def dishes_names
    @dish_list.dishes.map{|dish| dish.name}
  end

  def ordered_dishes_available?(hash_quantities)
    hash_quantities.keys.all?{|(name)| dishes_names.include? name }
  end

  def dish_total(hash_quantities)
    total_payment = each_dish_payment(hash_quantities).inject(0){|sum, dish| sum += dish[1] }
  end

  def ordered_price_list(hash_quantities)
    prices.delete_if{|key, value| hash_quantities[key] == nil}
  end

  def each_dish_payment(hash_quantities)
    ordered_price_list(hash_quantities).merge(hash_quantities){|key, price, quantity| price * quantity}
  end




end
