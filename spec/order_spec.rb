require 'order'

describe Order do
let(:menu) {double(:menu)}
let(:menu_class) {double(:menu_class, new: menu)}
subject(:order) {described_class.new(menu_class)}

  describe ' #initialize' do
    it ' 1. should initialize a menu' do
      expect(order.menu).to eq menu
    end
  end
end
