require 'restaurant'
describe Restaurant do
  subject(:restaurant) {Restaurant.new}
  let (:test_order) {double :test_order}
  let(:menu) do {"diet coke"=>0.99, "foie gras"=>18.50, "caviar"=>99.00,
   "oyster"=>0.99, "champagne"=>50.00} end

  context "Method check" do
    it {is_expected.to respond_to :accept_order}
    it {is_expected.to respond_to :deliver}
  end
  describe "#accept_order" do
    it 'should accept the order' do
      #allow(restaturant).to receive(:order_accepted) and_return menu
      test_order.instance_variable_set(:@checkout, true)
      restaurant.accept_order(test_order)
      #allow(test_order).to receive(:checkout).and_return true
      expect(restaurant.order_accepted).to include test_order
    end
  end
end