require 'restaurant'
describe Restaurant do
  subject(:restaurant) {Restaurant.new}
  let (:test_order) {double :test_order}

  context "Method check" do
  it {is_expected.to respond_to :accept_order}

  end
  describe "#accept_order" do
    it 'should accept the order' do
      expect(restaurant.accept_order(test_order)).eq @order_accepted
    end
  end
end