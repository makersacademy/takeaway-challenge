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

  # describe '#add' do (moved to add_to_order)
  #   before do
  #     allow(order).to receive(:add_item)
  #   end
  #   it 'adds one dish (and optional quantity) to order' do
  #     takeaway.add("Risotto con funghi porcini", 2)
  #     expect(order).to respond_to(:add_item)
  #   end
  # end

end
