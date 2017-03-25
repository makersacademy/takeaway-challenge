require 'order_builder'

describe OrderBuilder do
  subject(:order_builder) { described_class.new }
  let(:menu) { double :menu }

  describe '#initialization' do
    it 'should create a menu hash' do
      expect(order_builder.menu).to_not be_empty
    end
  end

  describe '#show_menu' do
    it 'should return menu' do
      allow(order_builder).to receive(:show_menu) {menu}
      expect(order_builder.show_menu).to match menu
    end
  end

  
end
