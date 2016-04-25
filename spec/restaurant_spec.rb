require 'restaurant'

describe Restaurant do

  subject(:restaurant){ described_class.new(menu, order, messenger) }
  let(:menu){ double :menu, dishes: nil, select_dish: dish }
  let(:order){ double :order, take_order: nil, text_confirmation: nil }
  let(:dish){ double :dish }
  let(:messenger){double :messenger, send_text: nil}

  it 'responds to show_menu' do
    expect(restaurant).to respond_to(:show_menu)
  end

  describe '#show_menu' do
    it 'lists available dishes with prices' do
      expect(restaurant.show_menu).to eq(menu.dishes)
    end
  end

  describe '#place_order' do
    it 'takes an order with dish and quantity' do
      expect(restaurant).to respond_to(:place_order).with(2).arguments
    end
  end

  it 'can check the total cost of an order' do
    expect(restaurant).to respond_to(:check_total)
  end

  describe '#confirm_order' do

    it 'sends a confirmation message' do
      expect(messenger).to receive(:send_text)
      restaurant.confirm_order
    end

    it 'resets the current order' do
      restaurant.confirm_order
      expect(restaurant.check_order).not_to eq order
    end

  end

end

