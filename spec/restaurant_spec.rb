require 'restaurant'

describe Restaurant do
  let(:sparkleBurgers) { Restaurant.new('Sparkle Burgers LTD')}

  let(:order001) { instance_double("Order", number: 1, basket: [])}

  it "initializes with a menu" do
    expect(sparkleBurgers.menu.kind_of?(Hash)).to eq(true)
  end

  describe "#view_menu" do
    it "allows a customer to view a menu" do
      expect(sparkleBurgers).to respond_to(:view_menu)
    end

    it "prints the menu in a readable format" do
      expect(sparkleBurgers.view_menu).to eq ("Sparkle Burgers LTD's Menu:\n, 1: Cheese burger, £10\n, 2: Cheese and bacon burger, £12\n, 3: Pulled pork burger, £15\n, 4: Fries, £6\n, 5: Chilli fries, £8\n, 6: Onion rings, £7\n, 7: Coke 330ml, £2\n, 8: Fanta 330ml, £2\n, 9: Brew Dog Vegabond 4.5%, £5")
    end
  end

  # describe "#start_order" do
  #   it "initializes a new order instance when user decides to start an order" do
  #     expect(sparkleBurgers.start_order).to eq("Your basket is now open for order number #{order001.number}")
  #   end
  # end

  describe "#choose_dish" do
    it "allows a user to select a dish number" do
      expect(sparkleBurgers.choose_dish(2)).to eq("Cheese and bacon burger has been added to your basket")
    end

    it "adds chosen dish to the order basket" do
      sparkleBurgers.choose_dish(2)
      expect(sparkleBurgers.open_order.basket).to eq [[:"Cheese and bacon burger", 12]]
    end

    it "adds more than one dish to the order basket" do
      sparkleBurgers.choose_dish(2)
      sparkleBurgers.choose_dish(4)
      expect(sparkleBurgers.open_order.basket).to eq [[:"Cheese and bacon burger", 12], [:"Fries", 6]]
    end

    describe "#add_to_order" do
      it "adds a hash to the order basket" do
        sparkleBurgers.choose_dish(1)
        expect(sparkleBurgers.open_order.basket).to eq [[:"Cheese burger", 10]]
      end
    end
  end



end
