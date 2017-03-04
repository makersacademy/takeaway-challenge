require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:order) { instance_double("Order") }

  context "testing #new on class" do
    subject(:takeaway_class) { described_class }
    it { is_expected.to respond_to(:new).with(2).arguments }
  end

  describe '#initialize' do
    it 'with a restaurant object' do
      expect(takeaway.restaurant).to be_a(Restaurant)
    end
    it 'with an order object' do
      expect(takeaway.order).to be_a(Order)
    end
  end

  describe '#add' do
    before do
      takeaway.menu.add_dish("Risotto con funghi porcini", 4.25)
      allow(order).to receive(:add_item)
    end

    it 'raises error message if item not in menu' do
      message = "Sorry, we don't have Farfale in our menu."
      expect { takeaway.add("Farfale", 3) }.to raise_error(message)
    end

    it 'instructs order to #add_item if item exists in menu' do
      takeaway.add("Risotto con funghi porcini", 2)
      expect(order).to respond_to(:add_item)
    end
  end

  describe '#order_summary' do
    before do
      takeaway.menu.add_dish("Risotto con funghi porcini", 4.25)
      allow(order).to receive(:summarise)
    end

    it 'raises error message if the order is empty' do
      message = "Sorry, but you have no items in your order to summarise"
      expect { takeaway.order_summary }.to raise_error(message)
    end

    it 'instructs order to summarise if it has items' do
      takeaway.add("Risotto con funghi porcini", 2)
      expect(order).to respond_to(:summarise)
    end
  end

  describe '#total' do
    before do
      allow(order).to receive(:calc_total)
    end
    it 'instructs order to calculate total' do
      expect(order).to respond_to(:calc_total)
    end
  end

  describe '#reset' do
    it 'resets order to empty' do
      takeaway.reset
      expect(takeaway.order.items).to be_empty
    end
  end

  describe '#pay' do
    context 'with a restaurant double' do
      let(:restaurant_dbl) { instance_double("Restaurant") }

      before do
        allow(restaurant_dbl).to receive(:checkout_order)
      end

      it 'instructs restaurant to checkout with given amount' do
        expect(restaurant_dbl).to respond_to(:checkout_order)
      end
    end
  end

end
