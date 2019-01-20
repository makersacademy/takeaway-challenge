require 'menu'

describe Menu do
  it {is_expected.to respond_to(:available_dishes)}
  it "initiates with an empty list of available dishes" do
  end

  context "available_dishes" do
    it "is an array" do
      expect(subject.available_dishes).to be_kind_of(Array)
    end
  end

  context "#add_dish" do
    it "adds Dish object to available_dishes"  do
      pointer = Dish.new("name",1)
      subject.add_dish(pointer)
      expect(subject.available_dishes).to include(pointer)
    end
    it "throws error if attempting to add non-Dish" do
      expect{subject.add_dish("hello, error!")}.to raise_error(TypeError, "expecting Dish class object")
    end
  end

  context "#lookup.dish_number" do
    it "returns an integer" do
    end
    it "gives the menu number of the dish, starting from 1" do
      pointer = Dish.new("name",1)
      subject.add_dish(pointer)
      expect(subject.lookup.dish_number(pointer)).to eq(1)
    end

    it "throws error if dish is not on menu." do
      expect {subject.lookup.dish_number(Dish.new("hello, error!",1))}.to raise_error("Dish doesn't exist")
    end
  end
end
