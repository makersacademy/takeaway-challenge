require 'order'

describe Order do

  subject(:order) {described_class.new}
  let(:dish) {double :dish}
  # let(:my_order) {double}

  describe '#select_meal' do
    it "should reject meals not listed on the menu" do
      expect{order.select_meal(dish)}.to raise_error "Please select a dish from the menu."
    end
    it "a valid dish should increase the size of your order by one." do
      # SOMEHOW NEED TO STUB THIS.
      expect{order.select_meal(dish)}.to change {order.my_order.length}.by(1)
    end
  end
end
