require_relative 'menu'

class Dish

  attr_reader :name, :price, :details

  def initialize(name, menu)
    @name = name
    @price = get_price(name, menu)
  end

  def get_price(name, menu)
    get_details(name, menu)
    @details[:price]
  end

  def get_details(name, menu)
    @details = menu.list.detect{ |dish|
      dish[:name] == name
    }
  end




end
