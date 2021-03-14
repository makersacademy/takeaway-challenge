class Item

  attr_reader :item, :name, :price, :description

  def initialize(name, price, description)
    @name = name
    @price = price
    @description = description
  end

  def change_name(name)
    @name = name
  end

  def change_price(price)
    @price = price
  end

  def change_description(description)
    @description = description
  end

end
