require 'order'
describe Order do
  subject(:order) { described_class.new }
  let(:fake_order) {double("fake_order", order: {"wing" => 3})}

  describe 'order' do
    it 'should give allow me to order wings, with a quantity of 3' do
      expect(fake_order.order).to eq ({"wing" => 3})
    end

    it 'should allow me to order 3 wings' do
      ordered = {"wing" => 3}
      expect(order.order("wing", 3)).to eq ordered
    end
  end


end
