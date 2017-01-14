require "restaurant"

describe Restaurant do
  subject(:restaurant){ described_class.new }

  name = "test"
  price = 5

  it {should respond_to(:dishes).with(0).argument}

  describe "#default_dishes" do
    it "checks a restaurant is initialized with a default set of dishes" do
      expect(restaurant.dishes[0].name).to include("chicken_tikka")
    end
  end

  describe "#add_dish" do
    it 'adds a dish to the dishes array' do
      expect{restaurant.add_dish(name, price)}.to change{restaurant.dishes.length}.by 1
    end
  end

  describe "#dishes" do
    it "can display the dishes at a certain restaurant" do
      expect(restaurant.dishes).to include(Dish)
    end
  end

end
