require 'menu'

describe Menu do
  subject(:menu){described_class.new(dish_class: dish_class)}
  let(:dish_class){double :dish_class, new: dish}
  let(:dish){double :dish, name: "chicken", price: 10}

  describe "#initialize" do
    it "should initialize with a dishes variable which is an empty array" do
      expect(menu.all_dishes).to eq []
    end
  end
  # to+be empty, length == 0

  describe "#add_dish" do
    it "should create a new dish object" do
      expect(dish_class).to receive(:new)
      menu.add_dish("chicken", 10)
    end

    it "should add dish to dishes array" do
      menu.add_dish("chicken",10)
      expect(menu.all_dishes.length).to eq 1
    end
  end

  describe "#list_dishes" do
    it "should return an array of dishes with their prices" do
      menu.add_dish("chicken",10)
      expect(menu.list_dishes).to eq "chicken - 10|"
    end
  end


end
