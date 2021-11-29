require_relative './checkout.rb'

class Basket
  attr_reader :in_basket, :total
  def initialize
    @in_basket = []
    @total = 0.0
  end

  def add_to_basket(dish)
    @in_basket << dish
    add_to_total(dish.price)
  end

  def remove_from_basket(dish)
    @in_basket.delete(dish)
    deduct_from_total(dish.price)
  end

  def view_basket()
    output_str = ""
    @in_basket.each{ |dish|
      output_str << "#{dish.name}: £#{sprintf('%.2f', dish.price)}\n"
    }
    output_str << get_format_total
    return output_str
  end

  def get_format_total()
    return "Total: £#{sprintf('%.2f', @total)}" 
  end

  def goto_checkout(basket = self, checkout_class=Checkout)
    @checkout = checkout_class.new(basket)
  end

  private
  def add_to_total(amount)
    @total += amount
  end

  def deduct_from_total(amount)
    @total -= amount
  end
end