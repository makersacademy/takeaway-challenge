require "dish"

describe Dish do
  describe "#initialize" do
    let(:subject) {described_class.new(name, price, id, quantity)}
    name, price, id, quaintity = "Lemon chicken", 515, 081, 2
    it "creates a dish with the given name" do
      expect(subject.name).to eq name
    end
    it "creates a dish with the given price" do
      expect(subject.name).to eq price
    end
    it "creates a dish with the given id" do
      expect(subject.name).to eq id
    end
    it "creates a dish with the given quantity" do
      expect(subject.name).to eq quantity
    end
    it "creates by default a dish qith quantity 1" do

    end
  end

  describe "#print_dish" do
    it "puts in the desired format the data" do
      expect(subject.print_dish).to eq "#{id}: #{name} ------- #{price}"
    end
  end
end
