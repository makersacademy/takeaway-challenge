require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new(menu, order) }
  let(:menu) { double(:menu, has?: true) }
  let(:order) { double(:order, summary: nil, has?: true) }
  let(:dish) { double(:dish) }
  let(:quantity) { double(:quantity) }

  context "Competent customer" do

    describe "#view_menu" do
      it "calls menu's display method" do
        expect(menu).to receive(:display)
        takeaway.view_menu
      end
    end

    describe "#order" do
      it "passes a dish to the add method of Order" do
        allow(takeaway).to receive(:get_dish) { dish }
        allow(takeaway).to receive(:get_quantity) { quantity }
        expect(order).to receive(:add).with(dish,quantity)
        takeaway.order
      end
    end

    describe "#remove" do
      it "passes a dish to the remove method of Order" do
        allow(takeaway).to receive(:get_dish) { dish }
        expect(order).to receive(:remove).with(dish)
        takeaway.remove
      end
    end

    describe "#view_order" do
      it "requests a summary of the order" do
        expect(order).to receive(:summary)
        takeaway.view_order
      end
    end

    describe "#complete_order" do
      it "completes the order" do
        allow(Text).to receive(:confirmation) { nil }
        allow(Order).to receive(:new).with(menu)
        takeaway.complete_order
      end
    end
  end

  context "Clumsy customer" do

    describe "#order" do
      it "raises error when order not on menu" do
        allow(takeaway).to receive(:get_dish) { dish }
        allow(menu).to receive(:has?) { false }
        message = "#{ dish } not on menu! Check spelling and retry."
        expect { takeaway.order }.to raise_error message
      end
    end

    describe "#remove" do
      it "raises error when removing item not ordered" do
        allow(takeaway).to receive(:get_dish) { dish }
        allow(order).to receive(:has?) { false }
        message = "#{dish} hasn't been ordered"
        expect { takeaway.remove }.to raise_error message
      end
    end
  end
end
