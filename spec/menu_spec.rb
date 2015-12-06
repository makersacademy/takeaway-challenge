require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#view' do
    it 'shows the list of dishes with prices' do
      expect(menu.view).to eq [
        {"Chips" => 3},
        {"Salad" => 4},
        {"Chicken" => 7},
        {"Fish" => 9},
        {"Daily special" => 15}
      ]
    end
  end
end
