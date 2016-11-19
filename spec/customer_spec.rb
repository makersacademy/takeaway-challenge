require './lib/customer.rb'

describe Customer do

subject(:customer) {described_class.new}

  context "Viewing dishes" do
    it "should list out available dishes to order" do
      expect(customer.view_available_dishes).to be_a(Hash)
    end
  end
end
