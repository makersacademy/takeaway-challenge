require 'takeaway'

describe Takeaway do
let(:menu){ double :menu, print_menu: { "Prawn Toast": 4.50, "Beef Chow Mein": 6.50 } }
subject(:takeaway) { described_class.new(menu) }

  describe '#print_menu' do
    it 'calls #print_menu for menu object' do
      takeaway.print_menu
      expect(menu).to have_received(:print_menu)
    end
    it "returns a list of dishes available with price" do
      expect(takeaway.print_menu).to eq ({ "Prawn Toast": 4.50, "Beef Chow Mein": 6.50 })
    end
  end
end
