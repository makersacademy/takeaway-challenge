require 'order'

describe Order do

  let(:order) {described_class.new}
  let(:food){double(:food)}


  describe "#select_item" do
    it 'allows for each item to be selected' do
      order.select_item(food)
      expect(order.put_in_basket).to include food
    end
  end

end
