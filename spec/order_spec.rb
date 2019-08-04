require 'order'
# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
# context 'select items' do

  describe Order do
    context 'place order method is functional' do
    let(:order){ described_class.new({ 'A' => 1550, "B" => 1050 }) }
    it 'takes method place order' do
      expect(order).to respond_to(:place_order)
    end
  end

  context 'customer can access menu' do
    let(:order) { described_class.new({ "A" => 1050, "B" => 1130 }) }
    it 'iterates through an array to show menu' do
      # expect(order.view_menu).to eq("A:15.50/nB:10.50")
      expect(STDOUT).to receive(:puts).with('A:10.50')
      expect(STDOUT).to receive(:puts).with('B:11.30')
      order.view_menu
    end
  end

  #view order and check current total
  context 'customer can view order and check current total ' do
    let(:order) { described_class.new({ "A" => 1550, "B" => 1130 }) }
    it 'iterates through an array to show order and current total' do
      # expect(order.view_menu).to eq("A:15.50/nB:10.50")
      order.select('A', 1)
      order.select('B', 1)
      expect(STDOUT).to receive(:puts).with('A(s)x1')
      expect(STDOUT).to receive(:puts).with('B(s)x1')
      expect(STDOUT).to receive(:puts).with('current total £26.80')
      order.view_order
    end
  end
end


#  allow(takeout).to receieve(:order).and_return
