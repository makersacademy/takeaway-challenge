require "restaurant"

describe Restaurant do
  let(:subject) { described_class.new }
  let(:item) { :tea }
  let(:quantity) { 2 }
  let(:amount) { 6 }
  let(:wrong_amount) { 7 }

  it "responds to see_menu method" do
    expect(subject).to respond_to(:show_menu)
  end
  
  describe "#show_menu" do
    it "shows menu" do
      expect(subject.show_menu).not_to be_empty
    end
  end
  
  describe "#select_items" do
    it "allows customer to select dishes" do
      subject.select_items(item, quantity)
      expect(subject.order.selection).to include(item)
    end
  end
  
  describe "#summary" do
    it "shows the order with total" do
      subject.select_items(item, quantity)
      expect(subject.summary).to eq "Total: £6"
    end
  end
  
  describe "#checkout" do
    it "responds to checkout method" do
      expect(subject).to respond_to(:checkout).with(1).argument
    end
    
    context "amount is correct" do
      it "confirms order" do
        subject.select_items(item, quantity)
        subject.summary
        expect(subject.checkout(amount)).to eq "Order confirmed!"
      end
    end
    
    context "amount is incorrect" do
      it "raises error" do
        subject.select_items(item, quantity)
        subject.summary
        expect{subject.checkout(wrong_amount)}.to raise_error "Incorrect amount"
      end
    end
  end
end