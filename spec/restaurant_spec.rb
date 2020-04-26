require "restaurant"

describe Restaurant do
  let(:subject) { described_class.new }
  let(:payment) { 6 }
    #2) let(:menu) { Menu.new }

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
      subject.select_items(:tea, 2)
      expect(subject.order.selection).to include(:tea)
    end
  end
  
  describe "#summary" do
    it "shows the order with total" do
      subject.select_items(:tea, 2)
      expect(subject.summary).to eq "Total: £6"
    end
  end
  
  describe "#checkout" do
    it "responds to checkout method" do
      expect(subject).to respond_to(:checkout).with(1).argument
    end
    
    context "payment amount is correct" do
      it "returns true" do
        subject.select_items(:tea, 2)
        subject.summary
        expect(subject.checkout(6)).to eq "Order confirmed!"
      end
    end
    
    context "payment amount is incorrect" do
      it "raises error" do
        subject.select_items(:tea, 2)
        subject.summary
        expect{subject.checkout(7)}.to raise_error "Amount does not equal bill total"
      end
    end

  end
end