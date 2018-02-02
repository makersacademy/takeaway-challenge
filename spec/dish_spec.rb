require 'dish'

describe Dish do

  subject(:dish) { described_class.new }
  let(:name) {double("name of dish")}
  let(:price) {double("price of a dish")}


  context "when created" do
    it "has an empty hash" do
      dish = Dish.new(name, price)
      expect(dish.details).to eq ({name: name, price: price})
    end
  end

end
