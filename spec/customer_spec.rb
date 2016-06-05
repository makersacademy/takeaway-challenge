require 'customer'

describe Customer do

  subject(:customer) { described_class.new(menu) }
  let(:menu) { double :menu }



  describe "#see_menu" do

    it "should respond to see_menu" do
      expect(customer).to respond_to(:see_menu)
    end

    it "should present the menu to the customer with prices" do
      allow(menu).to receive(:each){ "Rice: £1.50"}
      expect(customer.see_menu).to eq("Rice: £1.50")
    end
  end

  describe "choose" do

    it "should respond to order with 2 arguments" do
      expect(customer).to respond_to(:choose).with(2).arguments
    end

  end  
end
