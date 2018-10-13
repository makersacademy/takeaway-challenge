require 'menu'

describe Menu do
  let(:menu) { Menu.new(items) }
  let(:items) { [{ "Margherita" => 8 }, { "Roasted Vegetable" => 9 }, { "Chorizo" => 12 }] }

  describe '#initialize' do
    it 'should show a list of dishes with prices' do
      expect(menu.items).to eq items
    end
  end
end
