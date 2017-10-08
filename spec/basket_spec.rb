require 'basket'

describe Basket do
  subject(:basket) { described_class.new }

  describe "#new_item" do
    it "has a new item method" do
      expect(basket).to respond_to(:new_item)
    end
  end

end
