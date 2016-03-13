require 'byebug'
require 'order'

describe Order do

  let(:menu) { double :menu }
  subject(:order) { described_class.new(menu)}
  let(:item) { double(:item) }
  let(:quantity) { double(:quantity) }

  context 'when an order initializes' do
    describe '#initialize' do
      it 'has a date and time' do
        expect(order.time).to be_a Time
      end
      it 'has a hash to hold the order' do
        expect(order.order).to be_a Hash
      end
    end
  end
  context 'when adding to an order' do
    describe '#add_dish' do
      it 'adds the item to the order array' do
        allow(menu).to receive(:on_menu?).and_return(true)
        order.add_item("Hamburger", 7)
        expect(order.order).to include hamburger: 7
      end
    end
  end
  context 'when completing an order' do
    describe '#total' do
      it 'displays order total' do                          # couldn't tell you why this works
        allow(menu).to receive(:on_menu?).and_return(true)
        allow(menu).to receive(:price).and_return(5)
        order.add_item(:taco, 2)
        expect(order.total).to eq 10
      end
    end
  end
end

# QUESTIONS
# Would we put logic here to handle choices that don't exist? or is this handled by the interface?
