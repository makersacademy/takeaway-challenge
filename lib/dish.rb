class Dish
  attr_reader :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def display_info
    space_length = 40 - @name.length
    price = @price.to_s
    sign_space = price.length == 4 ? '   ' : '  '
    infor = @name + ' '*space_length + '£' + sign_space + price
    return infor
  end

end
