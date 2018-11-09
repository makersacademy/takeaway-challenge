require 'takeaway'
require 'menu'

describe Takeaway do
  describe '#view_menu' do
    it 'should provide a list of dishes' do
      shop = described_class.new(Menu.new)
      expect(shop.view_menu).not_to eq nil
    end
  end
end
