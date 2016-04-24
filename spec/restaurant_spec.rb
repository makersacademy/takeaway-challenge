require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new }
  let(:menu_class) {double :menu_class}

  describe '#initialize' do

  end

  describe '#display_menu' do
    it 'displays the menu to the customer' do
      allow(menu_class).to receive(:access)
      expect(restaurant.display_menu).to eq(menu_class.access)
    end
  end

  describe '#complete_order' do
    it 'sends a confirmation to the customer' do

    end
  end

  describe '#send_text' do
    before {allow(restaurant).to receive(:send_text)}
    it 'sends confirmation text message to the customer' do
      expect(restaurant).to receive(:send_text).with('Order confirmed: £37.95')
      restaurant.complete_order(37.95)
    end
  end

end