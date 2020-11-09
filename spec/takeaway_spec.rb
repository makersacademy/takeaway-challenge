require 'takeaway'

RSpec.describe Takeaway do

  let(:restaurant) { double :Restaurant }
  let(:basket) { double :Basket }
  subject(:takeaway) { described_class.new(restaurant, basket) }

  describe "#initialize" do
    it "creates a restaurant instance variable" do
      expect(takeaway.restaurant).to eq(restaurant)
    end
  end

  describe "#see_menu" do
    it "is called on an instance of the takeaway class" do
      expect(takeaway).to respond_to(:see_menu)
    end

    it 'returns the restaurant\'s menu' do
      allow(restaurant).to receive(:show_menu).and_return({'Rainbow dumpling' => 28, 'Half crispy aromatic duck' => 39})
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
      price = 28
      allow(restaurant).to receive(:check_availability).with(dish).and_return(true)
      allow(restaurant).to receive(:item_price).with(dish).and_return(28)
      allow(basket).to receive(:add_to_basket).with(dish, quantity, price).and_return("#{quantity}x #{dish}(s) added to your basket.")
      expect(takeaway.order(dish, quantity)).to eq("#{quantity}x #{dish}(s) added to your basket.")
    end
  end

  describe "#basket_summary" do
    it 'is called on a Takeaway instance' do
      expect(takeaway).to respond_to(:basket_summary)
    end

    it 'returns the summary of the basket' do
      allow(basket).to receive(:summary).and_return("Rainbow dumpling x4 = £112")
      expect(takeaway.basket_summary).to eq("Rainbow dumpling x4 = £112")
    end
  end
end