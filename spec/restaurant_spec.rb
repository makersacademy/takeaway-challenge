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

    end
  end

  describe '#send_text' do
    before {allow(restaurant).to receive(:send_text)}
    it 'sends confirmation message to the customer' do
      expect(restaurant).to receive(:send_text).with('Order confirmed, expected delivery time 20:01')
      restaurant.complete_order('20:01')
    end
  end

end