require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:selection) { { "tacos" => 5, "quesadillas" => 7 } }
  
  describe '#add_order' do
    it "allows a customer to order some dishes" do
      order.add_order("tacos", 5)
      order.add_order("quesadillas", 7)
    expect(order.selection).to eq(selection)
    end
  end
end