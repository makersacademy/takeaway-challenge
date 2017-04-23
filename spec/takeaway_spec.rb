require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new}

  describe '#show_menu' do
    context 'Shows the menu list' do
      it 'calls #menu_print' do
        expect(takeaway.menu).to receive(:print_menu)
        takeaway.show_menu
      end
    end
  end 

end
