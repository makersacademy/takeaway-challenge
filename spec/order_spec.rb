require 'order'
describe Order do
  subject(:order) { described_class.new }
  describe '#initialize' do

    it "has an empty array of items on initialization" do
      expect(order.order_items).to be_empty
    end

  end
end
