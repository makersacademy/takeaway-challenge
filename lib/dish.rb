require_relative 'menu'

class Dish

  attr_reader :name, :price, :details, :item

  def initialize(number, menu)
    @number = number
    @price = get_price(number, menu)
    @name = get_name(number, menu)
  end

  def create_item
    @item = details.delete(:number)
  end

  def get_name(number, menu)
    get_details(number, menu)
    @details[:name]
  end

  def get_price(number, menu)
    get_details(number, menu)
    @details[:price].to_f
  end

  def get_details(number, menu)
    @details = menu.list.detect{ |dish|
      dish[:number] == number }
  end

  def checkout
  end

  # def get_name_and_price
  #   {name => price}
  # end


end
