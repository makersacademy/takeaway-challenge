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

  describe "#calculate_total" do
    it "returns the order total, formatted nicely" do
      order_item_one = double(price: "5.00", quantity: "1")
      order_item_two = double(price: "3.00", quantity: "2")
      subject.instance_variable_set(:@o_items, [order_item_one, order_item_two] )

      expect(subject.calculate_total).to eq "£11.00"
    end
  end

  describe "#confirm" do
    it "sends a confirmation text with the time 1hr from now" do
      expect(Messager).to receive(:send_text).with("Hey there, thanks for your order! Your food will be with you at #{(Time.now + 3600).strftime("%H:%M")}.")
      subject.confirm
    end
  end
end
