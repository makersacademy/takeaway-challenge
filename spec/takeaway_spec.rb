require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:menu) { instance_double("Menu") }
  let(:order) { instance_double("Order") }

  context "testing #new on class" do
    subject(:takeaway_class) { described_class }
    it { is_expected.to respond_to(:new).with(2).arguments }
  end

  describe '#initialize' do
    it 'with a menu object' do
      expect(takeaway.menu).to be_a(Menu)
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

end
