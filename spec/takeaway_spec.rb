require 'takeaway'

RSpec.describe Takeaway do

  let(:restaurant) { double :Restaurant }
  let(:basket) { double :Basket }
  let(:message) { double :Message }
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

  describe "#total" do
    it 'is called on a takeaway instance' do
      expect(takeaway).to respond_to(:total)
    end

    it 'returns the total value of the basket' do
      random_value = 10
      allow(basket).to receive(:total_value).and_return(random_value)
      expect(takeaway.total).to eq(10)
    end
  end

  describe "#checkout" do
    it 'is called on a Takeaway instance' do
      expect(takeaway).to respond_to(:checkout).with(1).argument
    end

    it 'raises an error if customer pays wrong amount' do
      payment = 8
      allow(basket).to receive(:total_value).and_return(10)
      expect { takeaway.checkout(payment) }.to raise_error(StandardError)
    end

    it 'completes the order and sends a message over' do
      payment = 10
      allow(basket).to receive(:total_value).and_return(10)
      allow(takeaway).to receive(:complete_order).and_return("Thank you for your order: £10")
      expect(takeaway.checkout(payment)).to eq("Thank you for your order: £10")
    end
  end
end