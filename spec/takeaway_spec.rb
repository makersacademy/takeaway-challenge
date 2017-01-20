require 'takeaway'


describe "Takeaway" do

subject(:takeaway) { Takeaway.new(menu, order) }
let(:menu) { double :menu, print_menu: nil }
let(:dish) { double :dish }
let(:quantity) { double :quantity }
let(:order) { double :order, add: nil }
let(:summary) { "Chicken x#{quantity} = £11.00" }
let(:calc_total) { 1100 }

  describe "#creation" do

    it "should set order complete status to false" do
      expect(subject.completed).to be false
    end
  end

  describe "#get_menu" do
    it "should print a menu" do
      subject.get_menu
      expect(menu).to have_received(:print_menu)
    end
  end

  describe "#place_order" do

    context "when order is not complete" do

      it "should place an order" do
        allow(subject).to receive(:completed?).and_return(false)
        subject.place_order(dish, quantity)
        expect(order).to have_received(:add).with(dish, quantity)
      end
    end
  end

  describe "#basket_summary" do

    it "should print out a summary of the basket" do
      allow(order).to receive(:basket).and_return([["Chicken",quantity,1100]])
      takeaway.place_order("Chicken",quantity)
      expect(takeaway.basket_summary).to eq summary
    end
  end

  # describe "#checkout" do
  #   it "should calculate a total amount payable" do
  #     allow(subject).to receive(:completed?).and_return(false)
  #     takeaway.place_order("Chicken",2)
  #     expect(takeaway.checkout).to eq "Total: £11.00"
  #   end
  #
  # end
end
