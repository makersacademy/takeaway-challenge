require 'order'

describe Order do

  subject(:order){ described_class.new }
  let(:dish){instance_double("Dish")}

  before do
    allow(dish).to receive(:name){"dish"}
    allow(dish).to receive(:price){1}
  end

  describe "#view_dishes" do
    it "displays dishes at a specified restaurant" do
      restaurant = Restaurant.new
      restaurant.dishes << dish
      expect(order.view_dishes(restaurant)).to include(dish)
    end
  end

  describe "#select_dishes" do
    it "selects dishes at a specified restaurant" do
      restaurant = Restaurant.new
      restaurant.dishes << dish
      expect(order.select_dishes(restaurant, "dish")).to include(dish)
    end
  end
end
