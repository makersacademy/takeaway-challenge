require 'dish'

describe Dish do

  let(:dish) { Dish.new("Arrabiata", 9.99) }

  it "creates a new instance of class accepting 2 arguments" do
    expect(Dish).to respond_to(:new).with(2).arguments
  end

  describe "#initialize" do
    it "intiates instances with name and price" do
      expect(dish.name).to eq "Arrabiata"
      expect(dish.price).to eq 9.99
    end
  end

end
