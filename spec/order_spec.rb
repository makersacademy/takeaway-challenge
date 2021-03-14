require 'order'

describe Order do
  let(:order001) { Order.new }
  let(:incorrect_total) { Order.new }
  let(:cheeseBurger) { ["Cheese Burger", 10] }
  let(:fries) { ["Fries", 6] }
  let(:no_text) { double('Text') }

  it "initializes with an order number" do
    expect(order001.number).to eq(1)
  end

  it "initializes with an empty basket" do
    expect(order001.basket).to be_kind_of(Array)
  end

  describe "#add_to_basket" do
    it "adds a dish name to the basket array" do
      order001.add_to_basket(cheeseBurger)
      expect(order001.basket).to eq([["Cheese Burger", 10]])
    end

    it "adds more than one dish name to the array" do
      order001.add_to_basket(cheeseBurger)
      order001.add_to_basket(fries)
      expect(order001.basket).to eq([["Cheese Burger", 10], ["Fries", 6]])
    end
  end

  describe "#total_so_far" do
    let(:order002) { Order.new }

    it "let's the customer know the total cost of the order so far" do
      order002.add_to_basket(cheeseBurger)
      order002.add_to_basket(fries)
      expect(order002.total).to eq(16)
    end
  end

  describe "#view_basket" do
    it "can view the basket" do
      order001.add_to_basket(cheeseBurger)
      order001.add_to_basket(fries)
      expect(order001.view_basket).to eq("Viewing basket for order number 1:\n, Cheese Burger £10\n, Fries £6\n, Total cost of order: £16")
    end
  end

  describe "#calculate_total" do
    it "calculates the total of the order" do
      order001.add_to_basket(cheeseBurger)
      order001.add_to_basket(fries)
      expect(order001.total).to eq(16)
    end
  end

  describe "#total_correct?" do

    before do
      allow(Text).to receive(:new).and_return(no_text)
      allow(no_text).to receive(:send_text)
      allow(incorrect_total).to receive(:total_due).and_return(+5)
    end

    it "throws an error if the total is not correct" do
      incorrect_total.add_to_basket(cheeseBurger)
      incorrect_total.add_to_basket(fries)
      expect { incorrect_total.complete_order }.to raise_error "The total of this order is not correct!"
    end
  end

  describe "#complete_order" do
    before do
      allow(Text).to receive(:new).and_return(no_text)
      allow(no_text).to receive(:send_text)
    end

    it "confirms the order is complete and will be delivered an hour from now" do
      expect(order001.complete_order).to eq("Thank you! Your order was placed and will be delivered before #{(Time.now + 60 * 60).strftime("%I:%M %p")}")
    end
  end

  describe "#order_history" do
    it "has a history" do
      expect(order001.history).to be_kind_of(Array)
    end

    before do
      allow(Text).to receive(:new).and_return(no_text)
      allow(no_text).to receive(:send_text)
      order001.add_to_basket(cheeseBurger)
      order001.add_to_basket(fries)
    end

    it "adds to the history when complete_order" do
      order001.complete_order
      expect(order001.history).to eq([{ :"Order #1, completed on #{Time.now}:" => ["Cheese Burger", 10, "Fries", 6] }])
    end

    it "doesn't have a history unless first order completes" do
      expect(order001.history).to eq []
    end

    it "has two history records when two orders are completed" do
      order001.complete_order
      order001.add_to_basket(cheeseBurger)
      order001.add_to_basket(fries)
      order001.complete_order
      expect(order001.history.length).to eq(2)
    end

    describe "#reset_order" do
      describe "#reset_basket" do
        before do
          allow(Text).to receive(:new).and_return(no_text)
          allow(no_text).to receive(:send_text)
        end

        it "resets the basket after order is complete" do
          order001.add_to_basket(cheeseBurger)
          order001.add_to_basket(fries)
          order001.complete_order
          expect(order001.basket).to eq([])
        end
      end

      describe "#reset_total" do
        before do
          allow(Text).to receive(:new).and_return(no_text)
          allow(no_text).to receive(:send_text)
        end

        it "resets the total after order is complete" do
          order001.add_to_basket(cheeseBurger)
          order001.add_to_basket(fries)
          order001.complete_order
          expect(order001.total).to eq(0)
        end
      end

      it "increases the order count after order is complete" do
        order001.add_to_basket(cheeseBurger)
        order001.add_to_basket(fries)
        expect { order001.complete_order }.to change { order001.number }.by(+1)
      end
    end
  end
end
