require_relative 'basket.rb'
class PrintBasket

  def string(basket)
    body = ""
    basket.inventory_checker.each_pair do |dish,quant|
      body << basket_item_to_s(dish,quant)
    end
    body << "\nTotal: £ #{two_decimals(total(basket))}\n"
    return body
  end

  private
  def two_decimals(price)
    return ("%.2f" % price)
  end

  def total(basket)
    total = 0
    basket.inventory_checker.each_pair { |dish,quant| total += dish.price* quant }
    total
  end

  def basket_item_to_s(basket_item,quantity)
    return "#{basket_item.name.to_s.tr("_"," ")} x #{quantity} : £ #{two_decimals(basket_item.price*quantity)}\n"
  end
end
