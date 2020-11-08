require 'takeaway'

RSpec.describe Takeaway do

  let(:restaurant) { double :Restaurant }
  subject(:takeaway) { described_class.new(restaurant) }

  describe "#initialize" do
    it "creates a restaurant instance variable" do
      expect(takeaway.restaurant).to eq(restaurant)
    end

    it 'creates an empty basket array of hashes' do
      expect(takeaway.basket).to be_empty
    end
  end

  describe "#see_menu" do
    it "is called on an instance of the takeaway class" do
      expect(takeaway).to respond_to(:see_menu)
    end

    it 'returns the restaurant\'s menu' do
      allow(restaurant).to receive(:show_menu).and_return({'Rainbow dumplings' => 28, 'Half crispy aromatic duck' => 39})
      expect(takeaway.see_menu).to eq(restaurant.show_menu)
    end
  end

  describe "#order" do
    it "responds upon call" do
      expect(takeaway).to respond_to(:order).with(2).arguments
    end

    it 'raises an error when requested item not on the menu' do
      dish = 'fish'
      allow(restaurant).to receive(:check_availability).with(dish).and_return(false)
      expect { takeaway.order(dish) }.to raise_error(StandardError)
    end

    it 'adds item to basket' do
      dish = 'Rainbow dumplings'
      quantity = 4
      allow(restaurant).to receive(:check_availability).with(dish).and_return(true)
      takeaway.order(dish, quantity)
      expect(takeaway.basket).to include({dish => quantity})
    end
  end
end