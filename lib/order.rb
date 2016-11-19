class Order

  attr_reader :menu
  attr_accessor :basket

  def initialize(menu)
    @menu = menu
    @basket = {}
  end

  def add(item_number, quantity)
    menu.list.each do |item|
      increase_basket(item_number,quantity) if item[:item_number] == item_number
    end
  end


  private

  def increase_basket(item_number,quantity)
    if basket[item_number]
      basket[item_number] = basket[item_number] + quantity
    else
      basket[item_number] = quantity
    end
  end

end
