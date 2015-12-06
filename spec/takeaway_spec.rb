require 'takeaway'

  describe Takeaway do

  let (:takeaway) { described_class.new(menu, order_klass)}
  let (:menu) {double :menu, new: nil, dishes: dishes, on_menu?: nil}
  let (:dishes) {{soup: 4.99, sandwich: 5.99, pie: 7.99}}
  let (:order_klass) {double :order_klass, take_order: nil, new: order}
  let (:order) {double :order, take_order: nil, current_order: current_order}
  let(:current_order) {{pie: 3}}

  context 'when starting an order' do
    describe '#check_menu' do
      it 'should let them read the menu'do
        expect(takeaway.check_menu).to include menu.dishes
      end
    end
  end

  context 'when placing an order' do
    describe '#place_order' do
       it 'should allow an order to begin' do
         expect{takeaway.place_order(:pie, 3)}.
         not_to raise_error "Not on menu: pie"
       end

       it 'should not let them order off-menu' do
         expect{takeaway.place_order(:poison, 12)}.
         to raise_error "Not on menu: poison"
       end
    end
    describe '#check_order' do
      it 'should let the customer view their current order' do
        takeaway.place_order(:pie, 3)
        expect(takeaway.check_order).to include order.current_order
      end
    end
  end





end
