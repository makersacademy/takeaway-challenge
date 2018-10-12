require 'takeaway_order'

describe TakeawayOrder do

  let(:restaurant) { double :restaurant }
  let(:menu) { double :menu }
  subject { described_class.new(restaurant) }

  it "should display the menu" do
    allow(restaurant).to receive(:menu) { { "fish" => 10 } }
    expect(subject.display_menu).to eq({ "fish" => 10 })
  end

  context "adding items" do
    it "should allow the user to add items to basket" do
      allow(restaurant).to receive(:menu) { { "fish" => 10 } }
      expect(subject.add("fish", 2)).to eq "2x fish has been added to your basket"
    end

    it "should store the user's order in a basket" do
      allow(restaurant).to receive(:menu) { { "fish" => 10 } }
      subject.add("fish", 2)
      expect(subject.basket).to eq({ "fish" => 2 })
    end

    it "should not store items that are not on the menu" do
      allow(restaurant).to receive(:menu) { { "fish" => 10 } }
      expect(subject.add("not an item", 1)). to eq "That's not on the menu!"
    end
  end

  context "user adds another of the same item to the basket" do
    it "should increase the quantity of an item in the basket" do
      allow(restaurant).to receive(:menu) { { "fish" => 10 } }
      subject.add("fish", 2)
      subject.add("fish", 1)
      expect(subject.basket).to eq({ "fish" => 3 })
    end
  end

  context "deleting items" do
    it "should allow the user to delete items from the basket" do
      allow(restaurant).to receive(:menu) { { "fish" => 10 } }
      subject.add("fish", 2)
      subject.delete("fish", 1)
      expect(subject.basket).to eq({ "fish" => 1 })
    end

    it "should tell the user the item was deleted" do
      allow(restaurant).to receive(:menu) { { "fish" => 10 } }
      subject.add("fish", 3)
      expect(subject.delete("fish", 2)).to eq("2x fish has been deleted from your basket")
    end

    it "quantity should not go below zero" do
      allow(restaurant).to receive(:menu) { { "fish" => 10 } }
      subject.add("fish", 2)
      subject.delete("fish", 5)
      expect(subject.basket).to eq({ "fish" => 0 })
    end
    it "should not delete items that are not in the basket" do
      expect(subject.delete("fish", 1)). to eq "That's not in your basket!"
    end
  end

  context "verifying price of order" do
    it "should raise an error if expected price is wrong" do
      allow(restaurant).to receive(:bill) { 20 }
      allow(restaurant).to receive(:menu) { { "fish" => 10 } }
      subject.add("fish", 2)
      expect { subject.check_bill(10) }.to raise_error "Order costs £20, not £10"
    end

    it "should allow the user to verify the price of their order" do
      allow(restaurant).to receive(:bill) { 20 }
      allow(restaurant).to receive(:menu) { { "fish" => 10 } }
      subject.add("fish", 2)
      expect(subject.check_bill(20)).to eq "Your order costs £20"
    end
  end
end
