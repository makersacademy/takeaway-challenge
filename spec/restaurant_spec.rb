require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new(menu: menu, msg: msg) }
  let(:msg) { double :msg }
  let(:menu) { double :menu, view: list }
  let(:list) { {"Chips" => 3, "Salad" => 4, "Chicken" => 7, "Fish" => 9, "Daily special" => 15} }

  describe 'defaults' do
    it 'the customer_order does not exist' do
      expect(restaurant.customer_order).to be nil
    end

    it 'the actual_total does not exit' do
      expect(restaurant.actual_total).to be nil
    end
  end

  describe '#request_menu' do
    it 'returns the list of dishes with prices' do
      expect(restaurant.request_menu).to eq list
    end
  end

  describe '#order' do
    it 'stores the order in #customer_order' do
      restaurant.order
      expect(restaurant.customer_order).not_to be_empty
    end
  end
end
