require 'order'
require 'takeaway'

describe Order do
  let(:takeaway) { instance_double("Takeaway") }
  subject(:order) { described_class.new(Takeaway.new) }

  context "testing #new on class" do
    subject(:order_class) { described_class }
    it { is_expected.to respond_to(:new).with(1).argument }
  end

  describe '#initialize' do
    it 'with empty items list' do
      expect(order.items).to be_empty
    end

    it 'with a takeaway object' do
      expect(order.takeaway).to be_a(Takeaway)
    end
  end

  describe '#add_item' do
    it 'adds one item (and optional quantity) to order' do
      order.add_item("Risotto con funghi porcini", 3)
      expect(order.items["Risotto con funghi porcini"]).to eq 3
    end
  end

  describe '#summarise' do
    before 'adds dishes to the menu' do
      order.takeaway.menu.add_dish("Risotto con funghi porcini", 4.25)
      order.takeaway.menu.add_dish("Tomato and basil soup", 2.95)
    end
    before 'adds items to the order' do
      order.add_item("Risotto con funghi porcini", 3)
      order.add_item("Tomato and basil soup", 2)
    end
    it 'lists items with quantity and total prices' do
      order.summarise
      expect(order.summary).to eq "Risotto con funghi porcini x3 = £12.75\nTomato and basil soup x2 = £5.9\n"
    end
  end


end
