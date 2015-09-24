class Dish
  attr_reader :name, :price
  DISPLAY_LENGTH = 40

  def initialize(name, price)
    @name = name
    @price = price
  end

  def display_info
    space_length = DISPLAY_LENGTH - @name.length
    price = '%.2f' % @price
    @name + ' '*space_length + pound_sign_and_spacing + price
  end

  private

  def pound_sign_and_spacing
    sign_space = ('%.2f' % @price).length == 4 ? ' '*3 : ' '*2
    "£#{sign_space}"
  end

end
