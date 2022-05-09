require 'menu'

describe Menu do
  let (:menu) {Menu.new}
  describe '#list' do
    it 'has an a menu array with dishes and prices' do
      expect(menu.list).to eq ({Noodles: 6.25, Pizza: 11.78, Curry: 6.25})
    end
  end
end