require 'takeaway'

describe Takeaway do

  subject (:takeaway) { described_class.new(menu, order_klass, text) }
  let (:menu) { double :menu, new: nil, dishes: dishes, on_menu?: nil }
  let (:dishes) { {soup: 4.99, sandwich: 5.99, pie: 7.99} }
  let (:order_klass) { double :order_klass, take_order: nil, new: order }
  let (:order) { double :order, take_order: nil, current_order: current_order }
  let (:current_order) { {pie: 3} }
  let (:text) { double :text, send_text: nil }
  let (:test_number) { double :test_nunber }

  context 'when starting an order' do
    describe '#check_menu' do
      it 'should let them read the menu'do
        expect(takeaway.check_menu).to include menu.dishes
      end
    end
  end

  context 'when placing an order' do
    describe '#place_order' do

    it 'should not let them order off-menu' do
      expect{takeaway.place_order(:poison, 12)}.
        to raise_error "Not on menu: poison"
    end

      it 'should update the customer on items in basket' do
        line = "pie x 3: total £23.97\n"
        expect(takeaway.place_order(:pie, 3)).to eq line
      end
    end

    describe '#check_order' do
      it 'should let the customer view their current order' do
        expect(takeaway.check_order).to eq "pie x 3: total £23.97\n"
      end
    end

    context 'when an order is nearing completion' do
      describe '#confirm_order' do
        it 'should allow the customer to check the final order' do
          expect(takeaway.confirm_order).
            to eq "pie x 3: total £23.97\nFinal bill: £23.97"
        end
      end
    end

    context 'when an order is finished' do
      describe '#complete_order' do
        it 'should store the order in history' do
          takeaway.complete_order
          expect(takeaway.history).to include takeaway.order
        end
        it 'should send a text message' do
          expect(takeaway.text).to receive(:send_text).with(Integer)
          takeaway.complete_order
        end
      end
    end
  end
end
