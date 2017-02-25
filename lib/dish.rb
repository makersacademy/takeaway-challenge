require_relative 'menu'

class Dish

  attr_reader :name, :price, :details

  def initialize(number, menu)
    @number = number
    @name = name
    @price = get_price(number, menu)
  end

  def get_price(number, menu)
    get_details(number, menu)
    @details[:price]
  end

  def get_details(number, menu)
    @details = menu.list.detect{ |dish|
      dish[:number] == number
    }
  end




end
