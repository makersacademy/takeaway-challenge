require_relative 'menu'

class Dish

  DEFAULT_QUANTITY = 1
  attr_reader :details

  def initialize(number, menu)
    get_details(number, menu)
  end

  def get_details(number, menu)
    @details = menu.list.detect{ |dish|
      dish[:number] == number }
    details[:price] = details[:price].to_f.round(2)
    details
  end
end
