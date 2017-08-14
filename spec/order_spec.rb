require './lib/order'

describe 'Order' do

  subject(:order) { Order.new(menu) }
  let(:menu) { double Menu.new }

  context 'a new instance of an order' do

    describe 'a new order' do
      it 'creates an empty basket' do
        expect(subject.basket).to eq([])
      end
    end
  end

  context 'ordering food' do

    describe 'placing an order' do
      it 'stores your order' do
        expect(subject.place_order('curry', 1)).to be_a(Array)
      end
    end

    describe 'invalid order' do
      it 'raises an error' do
        expect { subject.place_order('pizza', 1) }.to raise_error("sorry this dish is not avaiable")
      end
    end
  end

  context 'order total' do

    describe 'the total cost' do
      it' ensures total cost equals cost of all dishes' do
        subject.place_order('curry', 5)
        expect(subject.total).to eq([[44.75]])
      end
    end
  end
end
