require 'takeaway'
require 'menu'

describe Takeaway do
  let(:menu) { double :menu, dish_list: Menu::DISHES }
  let(:takeaway) { described_class.new(menu)}
  describe 'initialization' do

    it 'has a menu' do
      expect(takeaway.menu).to eq menu
    end


  end
end
