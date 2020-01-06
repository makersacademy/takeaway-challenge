require 'menu'

describe Menu do 
  let(:subject) {Menu.new(items)}
  let(:items) { {chicken: 6, pizza: 10, chips: 4} }
    
  describe "#initialization" do
    it "stores a list of items" do
      expect(subject.menu).to eq(items)
    end
  end

  describe "#print_menu" do
    it "prints a list of the item" do
      expect(subject.print_menu).to eq "chicken £6, pizza £10, chips £4"
    end
  end

  describe "#item_included?" do
    it "checks if an item is included in a menu" do
      expect(subject.item_included?(:chicken)).to eq true
    end

    it "checks if an item isnt included" do
      expect(subject.item_included?(:fish)).to eq false
    end
  end

  describe "#price" do
    it "has a price of each item" do
      expect(subject.price(:chicken)).to eq 6
    end
  end

end