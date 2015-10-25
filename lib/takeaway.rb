class Takeaway
  attr_reader :menu, :order, :total
  def initialize
      @menu = [{ name: "Hamburger", price: 1},
        {name: "Pizza", price: 2},
        {name: "Hotdog", price: 2},
        {name: "Tacos", price: 3},
        {name: "Nachos", price: 1}
      ]
      @order = []
      @total = 0
  end

  def list_dishes
    @menu.map{ |dish| p "#{dish[:name]}: £#{dish[:price]}"}*", "
  end

  def add(item, quantity = 1)
    element = @menu.select{|dish| dish[:name] == item}
    element[0].store(:quantity, quantity)
    @total += ((element[0][:price])*(element[0][:quantity]))
    @order << element
    @order.flatten!
  end
end
