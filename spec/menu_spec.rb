require 'menu'

describe Menu do
  let(:item) { :calzone }
  let(:price) { 12.50 }
  let(:menu) { { :margherita => 7.50, :pepperoni => 10.50,
                 :calzone => 12.50, :diavola => 10.50 }
  }

  describe "#intialize" do
    it "initializes with a hash containing all menu items and prices" do
      expect(subject.items).to eq menu
    end
  end

  describe "#price" do
    it "returns the price for a given item" do
      expect(subject.price(item)).to eq price
    end
  end
end
