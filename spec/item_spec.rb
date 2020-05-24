require_relative '../lib/item.rb'

describe Item do
  describe '#name' do
    it "should have a readable name" do
      item1 = Item.new("name1", 1)
      expect(item1.name).to eq("name1")
    end
  end

  describe '#price' do
    it "should have a readable price" do
      item1 = Item.new("name1", 1)
      expect(item1.price).to eq(1)
    end
  end
end
