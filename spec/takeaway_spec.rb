require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }
  let(:menu) { double :menu, show_menu: "Margherita: £4.00" }


  context 'list of dishes on menu and their prices' do
    describe '#read_menu' do
      it 'shows the menu with prices' do
        expect(takeaway.read_menu).to eq("Margherita: £4.00")
      end
    end
  end

end
