require 'restaurant'

describe Restaurant do
  let(:menu_class) { double :menu_class }
  let(:messager_class) { double :messager_class}
  let(:price) { double :price }
  subject(:restaurant) { described_class.new(menu_class, messager_class) }

  describe '#display_menu' do
    it 'displays the menu to the customer' do
      allow(menu_class).to receive(:access) {{'dish'=>'price'}}
      expect(restaurant.display_menu).to eq('dish'=>'price')
    end
  end

  describe '#complete_order' do
    it 'sends a confirmation to the customer' do
      allow(messager_class).to receive(:send)
      expect(restaurant.complete_order).to eq(messager_class.send)
    end
  end
end