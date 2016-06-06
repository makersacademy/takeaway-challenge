class Menu

  attr_reader :items

  def initialize(file='./menu.txt')
    @items = (IO.readlines(file).map {|line| line.split(", ")}).to_h
  end

  def display
    @items.each {|item,price| "#{item} is £#{price}"}
  end

  def contains?(item)
    @items.has_key?(item)
  end

  def price(item)
    @items.values_at(item).pop.to_f
  end

end
