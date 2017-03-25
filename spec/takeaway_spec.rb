require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new }
  let(:item) { double :item }
  let(:new_order) { double :new_order }

  describe '#initialize' do
    it 'has an empty basket' do
      expect(takeaway.basket).to be_empty
    end
  end

  describe '#order' do
    it 'takes 2 arguments' do
      expect(takeaway).to respond_to(:order).with(2).argument
    end
  end

  describe '#total' do
    it 'calculates the total price of the basket' do
      allow(takeaway).to receive(:basket) {["Pizza"]}
      expect(takeaway.total).to eq 9.99
    end
  end
end
