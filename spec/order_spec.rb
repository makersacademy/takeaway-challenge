require 'order'

describe Order do
  let(:menu) { [Dish.new(36, "Chicken Korma", 7.95)] }
  let(:order) { Order.new(menu) }
  # let(:menu_class) { double :menu_class }
  # let(:dish_curry) { double :dish, display: "36. Chicken Korma £8.00" }
  # let(:dish_rice) { double :dish, display: "55. Pilau Rice £2.50"}
  # let(:dish_bread) { double :dish, display: "86. Peshwari Naan £3.00"}

  # it "receives an order and returns a total cost" do
  #   order_list = [{item: "Chicken Korma", quantity: 1},
  #               {item: "Pilau Rice", quantity: 1},
  #               {item: "Peshwari Naan", quantity: 2}]
  #   expect(order.place(order_list, 13.50)).to eq 13.50
  # end

  it "creates a new order from the menu with a total price" do
    order_list = [{ item: "Chicken Korma", quantity: 1 }]
    order_total = 7.95
    expect(order.place(order_list, order_total)).to eq "order placed"
  end
  it "throws an error when the total is wrong" do
    order_list = [{ item: "Chicken Korma", quantity: 1 },
                { item: "Pilau Rice", quantity: 1 },
                { item: "Peshwari Naan", quantity: 2 }]
    expect { order.place(order_list, 14.50) }.to raise_error "order cost does not match expected cost"
  end

end
