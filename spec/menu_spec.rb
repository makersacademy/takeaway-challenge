require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }
  # Defines subject as a newly instantiated object of the menu class that takes
  # one parameter, a hash of dishes, that is injected into the class object.

  let(:dishes) do
    {
      pizza: 9.99,
      burger: 2.99,
      chips: 1.99
    }
  # Simulates the dishes hash which we will inject into the menu object on
  # initialization. This allows us to separately modify the dishes data without
  # modifying the menu class.
  end

  describe "#dishes" do
    it "has a list of dishes with prices" do
      expect(menu.dishes).to eq(dishes)
    end
  # Tests the :dishes reader method
  end

  describe "#print" do
    it "prints a list of dishes with prices" do
      printed_menu = "Pizza £9.99, Burger £2.99, Chips £1.99"
      expect(menu.print).to eq(printed_menu)
    end
  # Checks the print method prints the hash of dishes and prices in a human
  # readable format, i.e. in the format specified by printed_menu
  end

  describe "#has_dish?" do
    it "tells if a dish is on the menu" do
      expect(menu.has_dish?(:pizza)).to be true
    end
  # Tests that "has_dish?" instance method of Menu class confirms when a
  # food item IS included in dishes hash.
    it "tells if a dish is on NOT on the menu" do
      expect(menu.has_dish?(:chowmein)).to be false
    end
  # Tests that "has_dish?" instance method of Menu class confirms when a food
  # item is NOT included in dishes hash.
  end

  describe "#price" do
    it "calculates a price" do
      expect(menu.price(:pizza)).to eq(dishes[:pizza])
    end
  # Tests that the "price" instance method of Menu class calculates the price of
  # a food item using hash look up with the food item (the key) returning the
  # corresponding price (the value)
  end
end
