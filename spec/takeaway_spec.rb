require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:order) { double :order, :add => 0 }
  #let(:menu) { double :menu }

  it 'can display a menu' do
    expect(takeaway.read_menu).to include({ "chips" => 1.00 })
  end

  it 'can add items to an order' do
    takeaway.add("chips", 2)#allow(order).to receive(:add)
    expect(takeaway.view_order).to eq({"chips" => 2})

  end

  context 'order total is correct' do
    it 'gives the correct total' do
      takeaway.add("coke", 2)
      takeaway.add("chips", 1)
      expect(takeaway.check_total(2.4)).to eq("£2.40 is the correct total")
    end
  end

  context 'order total is wrong' do
    it 'raises error' do
      takeaway.add("coke", 2)
      takeaway.add("chips", 1)
      expect(takeaway.check_total(3.5)).to eq("Wrong total: I have £2.40")
    end
  end

end
