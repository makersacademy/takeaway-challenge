require "order"

describe Order do
  let(:option_1) { double :dish, name: "Chicken Katsu Curry", price: 6 }
  let(:option_2) { double :dish, name: "Sweet & Sour Chicken", price: 6 }
  let(:option_3) { double :dish, name: "Kung Pao Chicken", price: 6 }
  let(:option_4) { double :dish, name: "Chow Mein", price: 4 }
  let(:option_5) { double :dish, name: "Egg-Fried Rice", price: 3 }
  let(:menu) { double :menu, list: "Chicken Katsu Curry £6, Egg-Fried Rice £3", contains?: true }
  let(:order) { Order.new(menu) }

  describe "#show_menu" do
    it "should showcase the menu" do
      expect(order.show_menu).to eq "Chicken Katsu Curry £6, Egg-Fried Rice £3"
    end
  end

  describe "#order" do
    it "should return a confirmation message when a given item has been added to the basket" do
      expect(order.order(option_1, 1)).to eq "1 Chicken Katsu Curry's has been added to your basket"
    end

    it "should return a different confirmation message if multiple quantities of a given item is added" do
      expect(order.order(option_1, 3)).to eq "3 Chicken Katsu Curry's has been added to your basket"
    end

    it "should raise an error if a requested dish is not on the menu" do
      allow(menu).to receive(:contains?).and_return(false)
      expect { order.order(option_4, 2) }.to raise_error "This dish is not on our menu"
    end
  end

  describe "#current_basket" do
    it "should return the customers current basket" do
      order.order(option_1, 2)
      order.order(option_5, 2)
      expect(order.current_basket).to eq "2x Chicken Katsu Curry = £12, 2x Egg-Fried Rice = £6"
    end
  end

  describe "#empty?" do
  it "should return 'true' if the basket is empty" do
    expect(order.empty?).to eq true
  end

  it "should return 'false' if the basket is not empty" do
    order.order(option_1)
    expect(order.empty?).to eq false
  end
end

  describe "#total" do
    it "should return the order's total cost" do
      order.order(option_1, 2)
      order.order(option_5, 2)
      expect(order.total).to eq "Your order's total: £18"
    end
  end

  describe "#correct?" do
    it "should return 'true' if the given price and total cost of the order match" do
      order.order(option_1, 2)
      order.order(option_5, 2)
      expect(order.correct?(18)).to eq true
    end

    it "should return 'false' if the given price does not match the total cost of the order" do
      order.order(option_1, 2)
      order.order(option_5, 2)
      expect(order.correct?(15)).to eq false
    end
  end

  describe "#complete" do
    it "should return a thank you message when an order is complete" do
      order.order(option_1)
      expect(order.complete).to eq "Thank you, come again!"
    end
  end
end