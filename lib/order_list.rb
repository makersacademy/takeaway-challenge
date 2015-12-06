require_relative 'dish_list'

class OrderList

  def initialize(dish_list=DishList.new)
    @dish_list = dish_list
  end


  def price_list
    @dish_list.price_list
  end

  def place_order(total=nil,amount_list)
  fail 'An ordered dish is unavailable' unless ordered_dishes_available?(amount_list)
  fail 'Total does not match sum of dishes in order' unless total == nil || total == dish_total(amount_list)
  end

  private

  def available_dish_names
    @dish_list.dishes.map{|dish| dish.name}
  end

  def ordered_dishes_available?(amount_list)
    amount_list.keys.all?{|(name)| available_dish_names.include? name }
  end

  def dish_total(amount_list)
    total_payment = each_dish_payment(amount_list).inject(0){|sum, dish| sum += dish[1] }
  end

  def ordered_price_list(amount_list)
    price_list.delete_if{|key, value| amount_list[key] == nil}
  end

  def each_dish_payment(amount_list)
    ordered_price_list(amount_list).merge(amount_list){|key, price, quantity| price * quantity}
  end




end
