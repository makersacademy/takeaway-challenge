require './lib/takeaway'
require './lib/menu'

describe Takeaway do

describe 'ordering' do
  before(:all) do
    let(:menu) { double Menu.new }
    allow(menu).to receive(:price_list).and_return('a menu')
    @takeaway = Takeaway.new(menu)
  end

  describe 'print_menu' do
    it 'prints menu on inititalize' do
      # allow(menu).to receive(:price_list).and_return('a menu')
      # takeaway = Takeaway.new(menu)
      expect(takeaway.print_menu).to eq('a menu')
    end
  end

  describe '#add_to_basket' do
    it 'adds the customers choice to the basket' do
      # allow(menu).to receive(:price_list).and_return('a menu')
      # takeaway = Takeaway.new(menu)
      expect(takeaway.add_to_basket('pork', 2)).to eq('pork burrito x 2 added')
    end
  end
end

  xdescribe '#sub_total' do
    it "adds to total array" do
      allow(menu).to receive(:price_list).and_return({ 'pork' => 8.00, 'chicken' => 7.50 })
      takeaway = Takeaway.new(menu)
      takeaway.add_to_basket('chicken', 2)
      takeaway.sub_total
      expect(takeaway.total).to eq [15.0]
    end

    it 'prints out order to customer' do
      allow(menu).to receive(:price_list).and_return({ 'pork' => 8.00, 'chicken' => 7.50 })
      takeaway = Takeaway.new(menu)
      takeaway.add_to_basket('chicken', 2)
      expect(takeaway.sub_total).to eq 'chicken x 2 is £15.00'
    end
  end

  xdescribe '#total_price' do
    it "totals the current order" do
      allow(menu).to receive(:price_list).and_return({ 'steak' => 8.50, 'chicken' => 7.50 })
      takeaway = Takeaway.new(menu)
      takeaway.add_to_basket('chicken', 2)
      takeaway.sub_total
      expect(takeaway.total_price).to eq(15.00)
    end
  end
end
