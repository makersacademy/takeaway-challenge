require 'order'

describe Order do
  subject(:order) { described_class.new}
  let(:subject) {double(order)}

  describe 'Make an order' do
    it 'creates menu' do
      expect(order.current_order).to include {}
    end

    it 'selects item' do
      order.select_item(:chips, 2)
      expect(order.current_order).to include :chips
    end

    it 'raises error when item not on menu selected' do
      expect {order.select_item('dogshit', 2)}.to raise_error 'please select item from menu'
    end

    it 'calculates price' do
      order.select_item(:fish, 2)
      order.select_item(:chips, 3)
      expect(order.calculate_price).to eq '12.00'
    end

    it 'gives current order' do
      order.select_item(:fish, 2)
      expect(order.check_order).to include :fish
    end
  end

    describe 'fail to complete order' do
      it 'fails if incorrect payment' do
        order.select_item(:chips, 3)
        expect{order.complete_order(10)}.to raise_error 'Incorrect Payment'
      end
    end

    before do
      allow(subject).to receive(:complete_order).and_return('send_text')
    end

    context 'successfully complete order' do
      it 'completes an order' do
        expect(subject.complete_order()).to eq ('send_text')
    end
  end
end
