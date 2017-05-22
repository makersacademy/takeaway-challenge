require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:order) { double :order }
  let(:menu) { double :menu }
  let(:notifier) { double :notifier }

  it { expect(takeaway).to respond_to :display_menu }
  it { expect(takeaway).to respond_to :create_order }
  it { expect(takeaway).to respond_to :complete_order }
  it { expect(takeaway).to respond_to :send_text }

  describe '#display_menu' do
    it 'allows to display the full menu' do
      expect(takeaway.display_menu.count).to eq 6
    end
  end

  describe '#create_order' do
    it 'allows to create an order' do
      expect(takeaway.create_order.flatten).not_to be_empty
    end
  end

  describe '#complete_order' do
    it 'allows to complete an order' do
      allow(order).to receive(:finalize_order).and_return(5)
      expect(takeaway.complete_order(5)).to eq 5
    end
  end

  describe '#send_text' do

  end

end
