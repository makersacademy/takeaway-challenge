require 'order'

describe Order do
  describe "#place_order" do
    it 'should be able to place a order of items from the menu' do
      subject.place_order(order)
      expect(subject.current_orders).to include(order)
    end
  end
end
