require 'basket'

describe Basket do
  context "#contents" do
    it "initializies with no dishes in contents" do
      expect(subject.contents).to be_empty
    end
  end
  context "#add" do
    it "adds a dish to basket#contents" do
      pointer = Dish.new("a dish",15)
      subject.add(pointer)
      expect(subject.contents).to include(pointer)
    end
  end
  context "#remove" do
    it "removes a dish" do
      pointer = Dish.new("a dish", 15)
      subject.add(pointer)
      subject.remove(pointer)
      expect(subject.contents).to_not include(pointer)
    end
    it "just removes one object when removing object with more than two calls" do
      pointer = Dish.new("a dish",15)
      subject.add(pointer)
      subject.add(pointer)
      expect(subject.contents.length).to eq(2)
      expect { subject.remove(pointer) }.to change{subject.contents.length}.by -1
    end
    it "raises error when trying to remove dish not in contents" do
      expect { subject.remove(Dish.new("a new guy",1))}.to raise_error("dish not found!")
    end
  end
end
