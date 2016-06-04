require 'customer'

describe Customer do

  subject(:customer) { described_class.new(menu) }
  let(:menu) {double :menu}

  describe "#see_menu" do

    it "should respond to see_menu" do
        expect(customer).to respond_to(:see_menu)
    end
  end

  describe "choose" do

    it "should respond to order with 2 arguments" do
      expect(customer).to respond_to(:choose).with(2).arguments
    end
  end
end
