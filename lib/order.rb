class Order

  attr_reader :basket

  def initialize(item=nil,quantity=0,basket=Basket.new)
    @item = item
    @quantity = quantity
    @basket = basket
  end

  def create(item,quantity,basket)
    basket.ordered[item] = quantity
    basket.ordered
  end
  
  def add(item,quantity=1,basket)
    if basket.ordered.include?(item)
      basket.ordered[item] = basket.ordered.values_at(item) + quantity
    else
      basket.ordered[item] = quantity
    end
  end

  def remove(item,quantity=1,basket)
    basket.ordered[item] = (basket.ordered.values_at(item).pop - quantity)
    basket.ordered.delete_if {|item,price| price <= 0 }
  end
end
