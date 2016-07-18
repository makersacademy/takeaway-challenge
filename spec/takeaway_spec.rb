require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, print_list: print_menu) }
  let(:print_menu) { "Margherita: £6.50" }
  let(:margherita) do { :margherita => 6.5 } end
  let(:peperroni) do { :peperroni => 7.2 } end


  describe '#print_menu' do
    it 'should print the menu with prices' do
      expect(takeaway.print_menu).to eq "Margherita: £6.50"
    end
  end

  context 'So a customer can add to their basket' do

    it 'allows single items to be ordered' do
      takeaway.add_item(item: 'margherita',quantity: 2)
      expect(takeaway.order).to eq({'margherita' => 2})
    end

    it 'allows multiple items to be ordered' do
      takeaway.add_item(item: 'margherita',quantity: 2)
      takeaway.add_item(item: 'peperroni',quantity: 3)
      expect(takeaway.order).to eq({'margherita' => 2, 'peperroni' => 3})
    end

  end

  context 'So a customer can verify their order looks right' do


  end
end
