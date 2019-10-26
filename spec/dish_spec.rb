require 'dish'

describe Dish do
  let(:dish) {Dish.new("burger", 10)}

  context "#initialize" do

    it "creates instance varible name that can be accessed from outside" do
      expect(dish.name).to eq "burger"
    end

    it "creates instance varible price that can be accessed from outside" do
      expect(dish.price).to eq 10
    end
  end
end
