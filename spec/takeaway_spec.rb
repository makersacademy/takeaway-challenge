require 'takeaway'

describe Takeaway do
  let(:menu_class) { double :menu_class, :display_menu => "menu" }

  describe 'view menu' do
    it 'asks menu class to display the menu' do
      takeaway = Takeaway.new(menu_class)
      expect(takeaway.view_menu).to eq(menu_class.display_menu)
    end
  end

end
