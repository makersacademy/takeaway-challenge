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


end
