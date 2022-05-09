require './lib/order.rb'

describe Order do
  let(:order) { Order.new }
  let(:menu) { double(:menu) }

  context "on initialize" do
    it "has a basket" do
      expect(order).to respond_to(:basket)
    end
    it "initializes with an empty basket (array)" do
      expect(order.basket).to eq []
    end
  end

  context "adding items to basket" do
    before(:each) do
      allow(menu).to receive(:contents).and_return({ :pizza => 'margherita', :price => 7 })
    end

    it "allows the customer to add an item from the menu to the basket" do
      order.add('margherita')
      expect(order.basket).to eq [{ :pizza => 'margherita', :price => 7 }]
    end

    it "allows the customer to add multiple numbers of a dish at once" do
      order.add('margherita', 2)
      expect(order.basket).to eq [{ :pizza => 'margherita', :price => 7 }, { :pizza => 'margherita', :price => 7 }]
    end

    it "raises an error if the item is not on the menu" do
      expect { order.add('false-item') }.to raise_error "That is not on the menu"
    end
  end

  context "checking order" do

    it "responds to being checked" do
      expect(order).to respond_to(:check)
    end

    it "responds to total" do
      expect(order).to respond_to(:total)
    end

    it "returns the total cost of the order" do
      allow(menu).to receive(:contents).and_return({ :pizza => 'margherita', :price => 7 })
      order.add('margherita', 2)
      expect(order.total).to eq 14
    end
  end

  context "completes the order" do

    it "responds to complete with the customer providing their phone number" do
      expect(order).to respond_to(:complete).with(1).argument
    end

  end

end
