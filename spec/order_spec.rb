require 'order'

describe Order do

  let(:order) { described_class.new }

  context "#initialize" do
    it "order initializes as an emtpy hash" do
      expect(order.order).to be_a Hash
    end
  end
end
