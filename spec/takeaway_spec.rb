require 'takeaway'
require 'order'

describe Takeaway do

  # let(:new_order) { instance_double(Order) }
  let(:new_order) { double :order, :submitted => false }
  subject { described_class.new(new_order) }

  describe 'Menu' do
    it 'displays a list of items to order from' do
      expect { subject.menu }.to output("Large chips - £2.45\nSmall chips - £2.00\nCod - £4.85\nPlaice - £4.85\nHaddock - £4.85\nFishcake - £1.15\nBattered sausage - £1.15\nSpring roll - £2.50\nBread roll - £0.55\nCurry sauce - £1.30\nMushy peas - £1.30").to_stdout
    end
  end

  describe "Basket" do
    before do
      allow(new_order).to receive(:add_dish)
      allow(new_order).to receive(:basket_items).and_return("2 x Small Chips")
      allow(new_order).to receive(:total).and_return("4.00")
    end

    it "should return the basket items" do
      subject.add("Small Chips", 2)
      expect(subject.basket).to eq "2 x Small Chips"
    end

    it "should return the basket in printable format" do
      expect { subject.print_basket }.to output("Your basket:\n2 x Small Chips\nOrder total: £4.00\n").to_stdout
    end
  end

  describe "Submit" do
    before do
      # allow(new_order).to receive(:submitted).and_return(true)
    end

    it "should not submit empty basket" do
      allow(new_order).to receive(:order_items).and_return([])
      # subject.submit_order
      expect { subject.submit_order }.to raise_error "Basket empty"
    end

    it "should not submit an order twice" do
      allow(new_order).to receive(:order_items).and_return(["a"])
      allow(new_order).to receive(:submitted).and_return(true)
      # subject.submit_order
      expect { subject.submit_order }.to raise_error "Order already sent"
    end
  end

end
