require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new(menu: menu) }
  let(:menu) { double :menu, view: list }
  let(:list) { [
    {"Chips" => 3},
    {"Salad" => 4},
    {"Chicken" => 7},
    {"Fish" => 9},
    {"Chef's special" => 15}
  ] }
#we have a real class, restaurant, with an injected fake class, menu. When our fake menu gets the command 'view' it just returns the list
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
