require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new }
  let(:item) { double :item }

  describe '#initialize' do
    it 'has an empty basket' do
      expect(takeaway.basket).to be_empty
    end
  end

  describe '#order' do
    it 'takes 1 argument' do
      expect(takeaway).to respond_to(:order).with(1).argument
    end
  end
end
