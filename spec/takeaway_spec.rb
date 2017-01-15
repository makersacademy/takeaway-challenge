require 'takeaway'

describe "Takeaway" do

subject(:takeaway) { Takeaway.new(menu, order) }
let(:menu) { double :menu, print_menu: nil }
let(:dish) { double :dish }
let(:quantity) { double :quantity }
let(:order) { double :order, add: nil }
let(:order_hash) { {:quantity => quantity, :dish => dish} }
let(:invalid_order) { double :invalid_order }
#let(:invalid_order?) { double :invalid_order, true }

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

  it "should error when placed incorrectly" do
    returned_menu = subject.get_menu
    allow(returned_menu).to receive(:include?).with(dish).and_return(false)
    expect{subject.invalid_order(dish)}.to raise_error "Invalid order"
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
    end
  end
  #
  #   context "when order placed incorrectly" do
  #
  #     #let(:get_menu) { subject.get_menu }
  #
  #     it "should raise an error" do
  #       allow(subject).to receive(:invalid_order).with(dish).and_return(false)
  #       #allow().to receive(:include?).with(dish).and_return(true)s
  #       expect {subject.place_order(:garbage, quantity)}.to raise_error "Invalid order"
  #     end
  #
  #     # it "should raise an error" do
  #     #   allow(subject).to receive(:invalid_order).with(dish).and_return(false)
  #     #   expect{subject.invalid_order(:garbage)}.to equ false
  #     # end
  #   end
  # end

end
