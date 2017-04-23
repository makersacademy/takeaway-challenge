require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new}
  it { is_expected.to respond_to(:order).with(2).argument}
  
  describe '#show_menu' do
    context 'Shows the menu list' do
      it 'calls #menu_print' do
        expect(takeaway.menu).to receive(:print_menu)
        takeaway.show_menu
      end
    end
  end

end
