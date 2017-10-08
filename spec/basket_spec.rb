require 'basket'

describe Basket do
  subject(:basket) { described_class.new }

  describe "#new_item" do
    it "has a new item method" do
      expect(basket).to respond_to(:new_item)
    end

    it "adds item to basket_contents" do
      expect(basket.basket_contents).to receive(:<<).with(1)
      basket.new_item(1)
    end
  end

end
