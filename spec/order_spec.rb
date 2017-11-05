require 'order'

describe Order do

  let(:set_menu) { Order.new({ pizza: 5 }, time_class) }
  let(:pizza) { "pizza" }
  let(:time_class) { double(send: "hello") }

  describe "Instantiation" do
    context "when instantiating" do
      it "should be an instance of class Order" do
        expect(subject).to be_an_instance_of(Order)
      end
    end
  end

  describe "#menu" do
    context "when reading the menu" do
      it "should return hash containing menu items" do
        expect(set_menu.menu).to eq({ pizza: 5 })
      end
    end
  end

  describe "#add_to_order" do
    context "when placing an order" do
      it "should accept two arguments" do
        expect(subject).to respond_to(:add_to_order).with(2).arguments
      end
      it "should raise an error if item ordered is not on menu" do
        expect { set_menu.add_to_order("duck", 1) }.to raise_error("That isn't on the menu")
      end
    end
  end

  describe "#cost" do
    context "when placing an order" do
      it "should increase the cost by 10" do
        set_menu.add_to_order(pizza, 2)
        expect(set_menu.cost).to eq(10)
      end
    end
  end

  describe "#current" do
    context "when adding items to order" do
      it "should update current to contain 2 pizzas" do
        set_menu.add_to_order(pizza, 2)
        expect(set_menu.current).to eq({ pizza: 2 })
      end
    end
  end

  describe "#breakdown" do
    context "before paying for an order" do
      it "should provide a breakdown of costs" do
        set_menu.add_to_order("pizza", 1)
        expect { set_menu.breakdown }
          .to output("pizza - 1 x £5, Your basket total is £5")
            .to_stdout
      end
      it "should raise an error if nothing added to order" do
        expect { set_menu.breakdown }.to raise_error("Nothing added to order yet")
      end
    end
  end

  describe "#pay" do
    context "when paying for an order" do
      it "should raise error if payment incorrect" do
        set_menu.add_to_order("pizza", 1)
        expect { set_menu.pay(2) }.to raise_error("Please pay £5 to complete order")
      end
      it "should raise error if paying for empty order" do
        expect { set_menu.pay(2) }.to raise_error("Nothing added to order yet")
      end
      it "should complete your order" do
        set_menu.add_to_order("pizza", 1)
        expect(set_menu.pay(5)).to eq("hello")
      end
    end
  end
end
