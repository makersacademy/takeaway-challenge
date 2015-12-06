require 'takeaway'

  describe Takeaway do

  let (:takeaway) { described_class.new(menu)}
  let (:menu) {double :menu, new: nil, dishes: dishes}
  let (:dishes) {{soup: 4.99, sandwich: 5.99, pie: 7.99}}

  context 'when a customer wants to order' do
    describe '#check_menu' do
      it 'should let them read the menu'do
        expect(takeaway.check_menu).to include menu.dishes
      end
    end
  end




end
