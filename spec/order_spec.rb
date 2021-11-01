require 'order'

describe Order do
  let(:order) { Order.new(menu) }
  let(:menu) { double(:menu) }
  let(:dishes) do
    { 'california roll' => 3, 'fried chicken' => 1, 'dumplings' => 3 }
  end

  describe '#add' do
    it 'can add dishes from the menu' do
      order.add('california roll', 3)
      order.add('fried chicken', 1)
      order.add('dumplings', 3)
      expect(order.dishes).to eq(dishes)
    end

    # test for exeption when someome tries to add something not on the menu
    # it 'should not accept orders that does not exist on the menu' do
    #   expect {
    #     order.add('katsu curry', 5)
    #   }.to raise_error 'this is not on the menu'
    # end
  end
end
