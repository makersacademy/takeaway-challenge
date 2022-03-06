require 'entry_point'

 describe ".take_order" do
    it "should ask for the order" do
      allow($stdin).to receive(:gets).and_return("7404785572", "1", "2", "2", "1", "checkout")
      menu = Menu.new
      order = Order.new(menu)
      take_order(menu, order)
      expect(order.order_list).to eq "Ealing + Chips"=>1, "Vegan Burger"=>2
    end

  end

  describe ".customer_phone_number" do
    it "should return cusotmers phone number" do
      allow($stdin).to receive(:gets).and_return( "7404785572", "1", "2", "2", "1", "checkout")
      menu = Menu.new
      order = Order.new(menu)
      take_order(menu, order)
      expect(customer_phone_number).to eq "+447404785572"
    end
  end