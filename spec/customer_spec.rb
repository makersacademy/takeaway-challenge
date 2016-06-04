require 'customer'

describe Customer do

  subject(:customer) { described_class.new(menu) }
  let(:menu) {double :menu}

  describe "#see_menu" do

    it "should respond to see_menu" do
        expect(customer).to respond_to(:see_menu)
    end
  end
end
