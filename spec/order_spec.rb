require 'order'
require 'menu'

describe Order do
  subject(:order) { Order.new }

  describe '#initialize' do
    it "creates an instance of Order class" do
      expect(subject).to be_an_instance_of(Order)
    end

    it "stores an order in an array" do
      expect(subject.basket).to be_an_instance_of(Array)
    end
  end

  describe '#add_to_basket' do
    it 'order responds to add_to_basket with 2 arguments' do
      expect(subject).to respond_to(:add_to_basket).with(2).arguments
    end

    it "adds dishes to basket depending on quantity selected" do
      subject.add_to_basket("Margherita", 1)
      subject.add_to_basket("Pepperoni", 1)
      expect(subject.basket).to eq(["Margherita", "Pepperoni"])
    end
  end

  # incomplete - test does not pass
  describe '#total_price' do
    it "gives price of dish" do
      subject.add_to_basket("Margherita", 1)
      subject.add_to_basket("Pepperoni", 1)
      expect(subject.total_price).to eq(13.00)
    end
  end
end
