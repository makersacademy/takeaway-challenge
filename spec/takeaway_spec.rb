require 'takeaway'
describe Takeaway do
  let(:takeaway) { Takeaway.new(menu, order) }
  let(:menu) { double(:menu, list_menu: output) }
  let(:order) { double(:order) }
  let(:output) { 'california roll --- £9, fried chicken --- £7' }
  let(:dishes) do
    { 'california roll' => 3, 'fried chicken' => 1, 'dumplings' => 3 }
  end

  describe '#list_menu' do
    it 'should print out a list of menu items' do
      expect(takeaway.list_menu).to eq(output)
    end
  end

  describe '#order' do
    it 'should be able to order from the list of dishes' do
      expect(order).to receive(:add).twice
      takeaway.order(dishes)
    end
  end
end
