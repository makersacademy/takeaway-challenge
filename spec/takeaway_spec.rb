require 'takeaway'

describe "Takeaway" do

subject(:takeaway) { Takeaway.new(menu, order) }
let(:menu) { double :menu, print_menu: nil }
let(:dish) { double :dish }
let(:quantity) { double :quantity }
let(:order) { double :order, add: nil }
let(:totals_summary) { double :totals_summary }

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

    context "when order placed properly" do

      it "should print out the new order" do
        returned_menu = subject.get_menu
        allow(returned_menu).to receive(:include?).with(dish).and_return(true)
        allow(subject).to receive(:competed?).and_return(true)
        allow(Order).to receive(:new).and_return(order)
        subject.place_order(dish, quantity)
        expect(order).to have_received(:add).with(dish, quantity)
      end

      # it "should calcuate the total cost per dish ordered" do
      #   returned_menu = subject.get_menu
      #   allow(returned_menu).to receive(:include?).with(dish).and_return(true)
      #   allow(subject).to receive(:competed?).and_return(true)
      #   allow(Order).to receive(:new).and_return(order)
      #   subject.place_order(dish, quantity)
      #   expect(subject.basket_summary).to eq totals_summary
      # end

    end

    context "when order placed incorrectly" do

      it "should raise an error" do
        returned_menu = subject.get_menu
        allow(returned_menu).to receive(:include?).with(:garbage).and_return(false)
        expect {subject.place_order(:garbage, quantity)}.to raise_error "Invalid order"
      end
    end
  end
end
