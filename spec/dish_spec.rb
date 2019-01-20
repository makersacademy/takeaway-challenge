require 'dish'

describe Dish do
  subject { Dish.new("name", 1) }
  context "#name" do
    it "stores dish name as symbol" do
      expect(subject.name).to be_kind_of(Symbol)
    end
    it "converts spaces in name into _ in symbols" do
      expect(Dish.new("Hello World",1).name).to eq(:Hello_World)
    end
  end
  context "#price" do
    it "stores dish price as a float" do
      expect(subject.price).to be_kind_of(Float)
    end
  end
end
