require 'order'

decribe Order do
  subject(:order) {described_class.new(Menu)}
  let (:menu) { double :menu}

  context "#ordering" do
    it 'order is initialised with an empty list' do
      expect(order.order_items).to eq []
    end
  end

end
