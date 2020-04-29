require "restaurant"

describe Restaurant do
  let(:order) { double :order }
  let(:menu) { double :menu }
  let(:subject) { described_class.new(menu, order) }
  let(:item) { :tea }
  let(:quantity) { 2 }
  let(:amount) { 6 }
  let(:wrong_amount) { 7 }

  it "responds to see_menu method" do
    expect(subject).to respond_to(:show_menu)
  end
  
  describe "#show_menu" do
    it "shows menu" do
      allow(menu).to receive(:show)
      subject.show_menu
      #expect(subject.show_menu).not_to be_empty
    end
  end
  
  describe "#select_items" do
    it "allows customer to select dishes" do
      allow(order).to receive(:add).with(item, quantity)
      subject.select_items(item, quantity)
      #expect(subject.order.selection).to include(item)
    end
  end
  
  describe "#summary" do
    it "shows the order with total" do
      allow(order).to receive(:print_order)
      subject.summary
    end
  end
  
  describe "#checkout" do
    it "responds to checkout method" do
      expect(subject).to respond_to(:checkout).with(1).argument
    end
    
    context "amount is correct" do
      it "confirms order" do
        allow(order).to receive(:add).with(item, quantity)
        allow(order).to receive(:print_order) { "Total: £6" }
        subject.select_items(item, quantity)
        allow(order).to receive(:total) { amount }
        subject.summary
        expect(subject.checkout(amount)).to eq "Order confirmed!"
      end
    end
    
    context "amount is incorrect" do
      it "raises error" do
        allow(order).to receive(:add).with(item, quantity)
        allow(order).to receive(:print_order) { "Total: £6" }
        allow(order).to receive(:total) { amount }
        subject.select_items(item, quantity)
        subject.summary
        p subject.summary
        p wrong_amount
        expect{subject.checkout(wrong_amount)}.to raise_error "Incorrect amount"
      end
    end
  end
end