require "./lib/item.rb"

describe Item do
subject(:item) {described_class.new("name", 7.0, "A1")}

  describe "#initialize" do

    it "has a name for each new item" do
      expect(item.name).to eq "name"
    end

    it "has a price for each new item" do
      expect(item.price).to eq 7.0
    end

    it "has a unique item reference for each item" do
      expect(item.reference).to eq "A1"
    end

  end
end
