require 'dish'

describe Dish do
  let(:dish) { Dish.new("burger", 10) }

  context "#initialize" do

    it "creates instance varible name that can be accessed from outside" do
      expect(dish.name).to eq "burger"
    end

    it "creates instance varible price that can be accessed from outside" do
      expect(dish.price).to eq 10
    end

    it "creates instance varible remaining_portions that defaults to 5 and can be called from outside" do
      expect(dish.remaining_portions).to eq Dish::DEFAULT_PORTION_NUMBER
    end

    it "number of portions can be overridden if required" do
      dish_with_lotds_of_portions = Dish.new("burger", 10, 20)
      expect(dish_with_lotds_of_portions.remaining_portions).to eq 20
    end
  end

  context "#remove_portion" do
    it "remove one portion" do
      expect { dish.remove_portion }.to change { dish.remaining_portions }.by -1
    end
  end

  context "#add_portion" do
    it "add 1 portion to dish" do
      expect { dish.add_portion }.to change { dish.remaining_portions }.by 1
    end
  end

end
