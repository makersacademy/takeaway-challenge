


class Order
  attr_reader :menu, :items
  def initialize(menu)
    @menu = menu
    @items = []
  end

  def add_dish(name,quantity)
    @menu.all_dishes.select{|dish| dish.name == name}.each{|dish| quantity.times{@items << dish}}
  end

  def place_order(sum)
    raise "Not enough money" if sum < total
    receipt = ""
    dish_and_quantity.each{|item| receipt << item + ", "}
    receipt << "Total : #{total}"
    receipt


  end
  # list _ dishes




private
# total is public
  def total
    @total = @items.map{|x| x.price}.inject(0){|x,y| x+y}
  end

  def dish_and_quantity
    list = []
    @items.each{|dish| list << "#{dish.name} - #{items.count(dish)}"}
    list.uniq
  end



end
