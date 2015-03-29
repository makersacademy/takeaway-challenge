class Takeaway
MENU = [
  { :name => "pizza", :price => 2}
  { :name => " pasta", :price =>2}
]

def menu
  MENU
end

def initialize(basket = [])
  @basket = basket
end

  attr_reader :basket

  def price(dish)
    item = MENU.detect{|item| item[:name] == dish.to_s}
    item[:price] if item
  end

  def add_to_basket(dish)
    item = MENU.detect{|item| item[:name] == dish.to_s}
    @basket << item if item
  end

  def remove_from_basket(dish)
    first_instance = @basket.index{|item| item[:name] == dish.to_s}
    @basket.delete_at(first_instace)
  end

  def order_total
    @total_price = @basket.map {|dish| dish[:price]}.reduce(:+)
  end

  def view_order
    @basket.inject(Hash.new{0}) do |order, dish|
      order[dish[:name]] += 1
      order
    end
  end
end