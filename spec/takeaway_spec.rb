require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new }
  let(:item) { double :item }
  let(:order) { double :order }
  let(:menu) { double :menu }

  describe '#initialize' do
    it 'has an empty basket' do
      expect(takeaway.basket).to be_empty
    end
  end

  describe '#order' do
    it 'takes 2 arguments' do
      expect(takeaway).to respond_to(:add).with(2).argument
    end
  end

  describe '#total' do
    it 'when empty is 0.00' do
      expect(takeaway.total).to eq 0.00
    end
  end
end
