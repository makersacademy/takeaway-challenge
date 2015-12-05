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

  describe '#request_menu' do
    it 'returns the list of dishes with prices' do
      #expect{ restaurant.request_menu }.to output.to_stdout
      expect(restaurant.request_menu).to eq list
    end
  end
end
