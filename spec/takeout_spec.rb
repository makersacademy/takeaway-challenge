require 'takeout'

describe Takeout do
  let(:Pizza) {double :Pizza => 6}
  let(:Water) {double :Water => 1}

  it { is_expected.to respond_to(:add_item).with(2).arguments }


  describe "add item" do
    it "to order with price" do
      subject.add_item :Pizza
      expect(subject.order).to eq [item: :Pizza, amount: 1, price: "£6"]
    end

    it "multiples to order with price" do
      subject.add_item :Pizza, 2
      expect(subject.order).to eq [item: :Pizza, amount: 2, price: "£12"]
    end

    it "updates total with price" do
      subject.add_item :Pizza, 2
      expect(subject.total).to eq 12
    end

    it "updates order when more items added" do
      subject.add_item :Pizza
      subject.add_item :Water
      expect(subject.order).to eq [{item: :Pizza, amount: 1, price: "£6"}, {item: :Water, amount: 1, price: "£1"}]
    end

    it "raises an error when an item isn't on menu" do
      expect{subject.add_item :Orange_Juice}.to raise_error 'Item not on menu'
    end

    it "displays order and total after each added item " do
      subject.add_item :Water
      expect(subject.add_item :Pizza, 2).to eq (subject.display_order)
    end
  end

  describe "display_order" do
    it "prints out order and total price" do
      subject.add_item :Water
      expect(subject.display_order).to eq("#{subject.order}; Total: £#{subject.total}")
    end
  end

  describe "pay" do
    it "raises an error with incorrect amount" do
      expect{subject.pay 5}.to raise_error 'Incorrect payment amount'
    end

    it "returns thank you message" do
      subject.add_item :Water
      expect(subject.pay 1).to eq("Thank you! You will be receiving a text confirmation shortly!")
    end
  end

end
