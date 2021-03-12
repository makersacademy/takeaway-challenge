require 'restaurant'

describe Restaurant do
  let(:sparkleBurgers) { Restaurant.new('Sparkle Burgers LTD')}

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
end
