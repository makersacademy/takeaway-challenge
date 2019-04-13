require 'order'

describe Order do

  subject(:order) { described_class.new }

  describe "#show" do
    it "a list of dishes" do
      expect(order).to respond_to(:print).with(1).argument
    end
  end

end
