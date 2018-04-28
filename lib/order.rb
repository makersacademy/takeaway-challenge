require_relative 'dish'

class Order
  attr_reader :current_total

  def initialize(class_type = Dish)
    @basket = {}
    @current_total = 0
    @class_type = class_type
  end

  def basket
    @basket.dup
  end

  def add_to_basket(item, number)
    if in_basket?(item)
      @basket[item] += number
      return "Added #{number} more of #{item} to basket"
    else
      @basket[item] = number
      "Added #{number} of #{item} to basket"
    end
  end

  private

  def in_basket?(item)
    @basket.has_key? item
  end
end
