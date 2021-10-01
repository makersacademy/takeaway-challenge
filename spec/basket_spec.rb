require "basket"

RSpec.describe Basket do
  let(:basket) { Basket.new }
  describe ".add_item" do
    it "adds food to the basket" do
      basket.add_item({ :item => "D1 - Rainbow Maki", :price => 8.8 })
      expect(basket.view_basket).to eq [{ :item => "D1 - Rainbow Maki", :price => 8.8 }]
    end
  end
end
