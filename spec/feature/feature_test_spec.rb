require 'dish'
require 'menu'
require 'order'

context "Placing an order" do
  specify "you can choose dishes from a menu and place an order" do
    dishes = []
    dishes.push Dish.new("chicken sandwich", 5.50)
    dishes.push Dish.new("beef wellington", 8.70)
    dishes.push Dish.new("tofu wrap", 6.00)
    dishes.push Dish.new("bean salad", 7.20)
    dishes.push Dish.new("coffee ice cream", 3.65)

    menu = Menu.new(dishes)

    output = "Number | Dish".ljust(32) + "Price\n"
    dishes.each_with_index do |dish, i|
      output << "[#{i + 1}]".ljust(9)
      output << dish.name.ljust(20, '.')
      output << ("%.2f\n" % [dish.price]).rjust(9, '.')
    end
    expect(menu.list_dishes).to eq output

    expect(menu.select_dish(1)).to eq dishes[0]

    expect($stdin).to receive(:gets).and_return("1\n", "2\n", "5\n", "1\n", "\n")
    order = Order.new(menu)

    expect(order.total).to eq 14.65

    summary = "Summary:\n"
    summary << "2 x chicken sandwich (11.00)\n"
    summary << "1 x coffee ice cream (3.65)\n"
    summary << "Total: 14.65"
    expect(order.summary).to eq summary
  end
end
