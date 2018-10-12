require 'menu'

describe Menu do
  let(:menu) { Menu.new }
  describe '#show' do
    it 'should show me a list of dishes with prices' do
      expect(menu.show).to eq "Fish and Chips: £12\nSalad: £10"
    end
  end
end
