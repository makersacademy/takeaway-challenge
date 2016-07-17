require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, print_list: print_menu, find_item_cost: ) }
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

    before do
      takeaway.add_item(item: peperroni , quantity: 3)
      takeaway.add_item(item: margherita , quantity: 2)
    end

    it 'they can check what\'s in their basket' do
      expect(takeaway.view_order).to eq 'Peperroni x 3 = £21.60 Margherita x 2 = £13.00'
    end

    it 'they can see their total bill' do
      expect(takeaway.total_cost).to eq 'Total: £34.60'
    end

  end
end
