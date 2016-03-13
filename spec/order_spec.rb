require 'byebug'
require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:item) { double(:item) }
  let(:quantity) { double(:quantity) }

  context 'when an order initializes' do
    describe '#initialize' do
      it 'has a date and time' do
        expect(order.time).to be_a Time
      end
      it 'has an empty array to hold the order' do
        expect(order.order).to be_empty
      end
    end
  end
  context 'when receiving an order' do
    before(:each) do
      order.choice('Chicken curry', 2)
      order.choice('Massman curry', 3)
    end
    describe '#choice' do
      it 'puts item and quantity to a temp array' do                              # i'd like to minimize access to 'selection'. private methods?
        expect(order.selection.length).to eq 2
      end
    end
    describe 'compile_order' do
      it 'puts compiled order into order' do
        expect{ order.compile_order }.to change{ order.order.length}.by 2
      end
      # it 'has an item with 3 items' do
      #   expect(order.order[0].length).to eq 3
      # end
    end
  end
end

# QUESTIONS
# Would we put logic here to handle choices that don't exist? or is this handled by the interface?
