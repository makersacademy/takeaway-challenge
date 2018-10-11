require 'takeout'

describe TakeOut do
  describe '#show_menu' do
    it 'has a menu which shows item and price' do
      takeout = TakeOut.new
      expect(takeout.show_menu).to eq TakeOut::MENU
    end
  end
end
