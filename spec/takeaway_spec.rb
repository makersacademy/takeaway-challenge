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
      expect(takeaway.create_order).to eq :order
    end
  end

  describe '#complete_order' do
  
  end

  describe '#send_text' do

  end

end
