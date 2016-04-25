require 'order'
describe Order do
  subject(:order) {described_class.new(menu)}

  let(:menu) {double :menu}
  let(:dishes) {{:chicken => 5, :meatballs =>3}}
  let(:total) {(5*3 + 3*5.5)}

  describe '# add' do
    context 'When the dish is not on the menu' do
      it 'adds dishes from the menu to the order' do
        allow(menu).to receive(:has_dish?).and_return true
        order.add(:chicken, 5)
        order.add(:meatballs, 3)
        expect(order.ordered_dishes).to eq dishes
      end
    end

    context 'When the dish is not on the menu' do
      it 'does not add a dish to the order' do
        allow(menu).to receive(:has_dish?).and_return false
        expect { order.add(:ham, 5)}.to raise_error "Cannot be added: not in the menu"
      end
    end
  end

  describe '# total' do
    it 'Calculates the order total' do
    allow(menu).to receive(:has_dish?).and_return true
    allow(menu).to receive(:price).with(:chicken).and_return 3
    allow(menu).to receive(:price).with(:meatballs).and_return 5.5
    order.add(:chicken, 5)
    order.add(:meatballs, 3)
    total = 31.5
    expect(order.total).to eq total
  end
  end

end
