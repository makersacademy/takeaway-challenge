require_relative 'item'

class Menu

  attr_reader :items

  def initialize
    @items = [
    Item.new('Satay', 4.50),
    Item.new('Spring rolls', 3.00),
    Item.new('Tom yum soup', 4.90)
    ]
  end

  def get_item(food)
    items.each { |item| return item if item.name == food }
    fail 'Sorry we don\'t have that item'
  end

end


    # 'Spring rolls'        => 2.20,
    # 'Tom yum soup'        => 4.90,
    # 'Green curry'         => 6.50,
    # 'Red curry'           => 6.50,
    # 'Panang curry'        => 6.50,
    # 'Pad thai'            => 5.50,
    # 'Pad see ew'          => 6.80,
    # 'Steamed rice'        => 2.50,
    # 'Coconut rice'        => 2.80
