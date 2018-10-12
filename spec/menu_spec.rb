require 'menu'

describe Menu do
  let(:menu) { Menu.new }
  let(:items) { "Margherita: £8\nRoasted Vegetable: 9\nChorizo: £12" }
  describe '#show' do
    it 'should show a list of dishes with prices' do
      expect(menu.show(items)).to eq items
    end
  end
end
