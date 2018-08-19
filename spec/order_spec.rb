require "order"

describe Order do
  describe "#create_order_item" do

    it "takes a user's input and creates a new OrderItem" do

    menu_item_double = double(number: "01", dish: "spaghetti", price: "5.40")
    qty = "2"

    order_item_double = double
    expect(OrderItem).to receive(:new).with(menu_item_double.number, menu_item_double.dish, menu_item_double.price, qty).and_return(order_item_double)

    subject.create_order_item(menu_item: menu_item_double, quantity: qty)

    expect(subject.o_items).to eq([order_item_double])

    end
  end
end
