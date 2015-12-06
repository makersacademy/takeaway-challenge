class Menu

  DISHES = {
    Appetisers:
      [{name: "Olives", price: 2},
      {name: "Hummus", price: 1.5}],
    Mains:
      [{name: "Beef", price: 7},
      {name: "Chicken", price: 6}],
    Desserts:
      [{name: "Sorbet", price: 3},
      {name: "Tart", price: 4}]}

  def initialize(order = Order)
    @order_klass = order
  end

  def view
    "THE MENU\n"+readable_list
  end

  def choose(dish_name, quantity = 1)
    @order = @order_klass.new
    @order.add(add_quantity(find(dish_name), quantity))
  end

  private

  def readable_list
    string = ""
    DISHES.each do |section, dishes|
      string += "#{section}\n"
      dishes.each { |dish| string += "#{dish[:name]} $#{dish[:price]}\n"}
    end
    string
  end

  def find(dish_name)
    DISHES.each do |section, dishes|
      dishes.each do |dish|
        return dish if dish[:name] == dish_name
      end
    end
  end

  def add_quantity(dish, quantity)
    dish.merge(quantity: quantity)
  end

end
