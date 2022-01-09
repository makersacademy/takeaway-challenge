require 'order'

RSpec.describe Order do

  let(:menu) { double 'Menu', :dish_in_menu? => true, :menu => { 'Beer' => 5 } }
  subject { Order.new(menu) }

  describe '#finish_order' do
    it 'closes the order' do
      expect { subject.finish_order }.to change { subject.closed }.from(false).to(true)
    end
  end

  describe '#add_dish' do
    context 'when dish is in menu' do
      it 'adds the dish and price to the order' do
        subject.add_dish('Beer')
        expect(subject.order.last['Beer']).to eq(5)
      end
    end
    context 'when dish is not in menu' do
      it 'does nothing' do
        allow(menu).to receive(:dish_in_menu?).and_return(false)
        subject.add_dish('Chips')
        expect(subject.order).to be_empty
      end
    end
    context 'when order is closed' do
      it 'throws an error' do
        subject.finish_order()
        expect { subject.add_dish('Beer') }.to raise_error('Order is already finished')
      end
    end
  end

  describe '#calc_sum' do
    it 'returns the sum of what is currently in the order' do
      3.times { subject.add_dish('Beer') }
      expect(subject.calc_sum).to eq (15)
    end
  end

end
