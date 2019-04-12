require "dish.rb"

describe Dish do
  name, price, id = "Lemon chicken", 515, 81
  let(:subject) { described_class.new(id, name, price) }

  describe "#initialize" do
    it "creates a dish with the given name" do
      expect(subject.name).to eq name
    end
    it "creates a dish with the given price" do
      expect(subject.price).to eq price
    end
    it "creates a dish with the given id" do
      expect(subject.id).to eq id
    end
  end

  describe "#print_dish" do
    it "puts in the desired format the data" do
      expect(subject.print_dish).to eq "#{id}: #{name} ------- #{price}"
    end
  end
end
