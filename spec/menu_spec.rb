require "menu"

describe Menu do
  subject(:menu) { described_class.new(name) }
  let(:name) { double(:string) }
  let(:dish) { double(:dish) }
  let(:order) { double(:order) }
  let(:dish_name) { "Raw Vegan Lasagna" }
  let(:dish_price) { 6 }
  let(:dish_type) { "Main course" }

  describe "initialization" do
    it "should receive a name at initialization" do
      expect(menu.name).to eq name
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
      allow(dish).to receive_messages(:name => dish_name, :price => dish_price, :type => dish_type)
    end

    it "should display dishes by type" do
      expect { menu.display }.to output("Starters:\nMain courses:\nRaw Vegan Lasagna £6\nRaw Vegan Lasagna £6\nDesserts:\n").to_stdout
    end
  end

  describe "#order" do
    before do
      menu.add_dish(dish)
      allow(dish).to receive_messages(:name => dish_name, :price => dish_price)
    end
    it "should confirm that a dish has been added to the order" do
      expect { menu.order(dish_name) }.to output("Raw Vegan Lasagna added to order\n").to_stdout
    end

    it "should raise an error if the user tries to order a dish not on the menu" do
      expect { menu.order("Cheese Toastie") }.to raise_error "That item is not on the menu"
    end
  end
end
