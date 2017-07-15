require "menu"

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) { double(:dish) }
  let(:order) { double(:order) }

  describe "initialization" do
    it "should initialize with an empty array of dishes" do
      expect(menu.dishes).to be_empty
    end
  end

  describe "#add_dish" do
    it "should add a dish to the dishes array" do
      expect(menu.add_dish(dish)).to eq [dish]
    end
  end

  describe "#display" do
    before do
      2.times { menu.add_dish(dish) }
      allow(dish).to receive_messages(:name => "Raw Vegan Lasagna", :price => 6)
    end
    it "should print a list of the dishes it contains" do
      expect { menu.display }.to output("Raw Vegan Lasagna £6\nRaw Vegan Lasagna £6\n").to_stdout
    end
  end

  describe "#new_order" do
    it "should create an order object and save it as an instance variable" do
      menu.new_order
      expect(menu.current_order).not_to be_nil
    end
  end

  describe "#order" do
    before do
      menu.add_dish(dish)
      allow(dish).to receive_messages(:name => "Raw Vegan Lasagna", :price => 6)
      menu.new_order
    end
    it "should confirm that a dish has been added to the order" do
      expect { menu.order("Raw Vegan Lasagna") }.to output("Raw Vegan Lasagna added to order\n").to_stdout
    end

    it "should raise an error if the user tries to order a dish not on the menu" do
      expect { menu.order("Cheese Toastie") }.to raise_error "That item is not on the menu"
    end
  end
end
