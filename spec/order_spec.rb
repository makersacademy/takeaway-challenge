require "order"

describe Order do
  subject(:order) { described_class.new }
  let(:dish) { double(:dish) }
  let(:name) { "Raw Vegan Lasagna" }
  let(:price) { 6 }
  let(:phone_number) { double(:string) }

  describe "#add" do
    it "should receive dishes from the menu" do
      expect(order.add(dish)).to eq [dish]
    end
  end

  describe "#total" do
    before do
      2.times { order.add(dish) }
      allow(dish).to receive_messages(:name => name, :price => price)
    end

    it "should give a total cost for the order" do
      expect { order.total }.to output("Order total: £#{price * 2}\n").to_stdout
    end
  end

  describe "#display" do
    before do
      2.times { order.add(dish) }
      allow(dish).to receive_messages(:name => name, :price => price)
    end

    it "should print a list of dishes in the order" do
      expect { order.display }.to output("#{name} £#{price}\n#{name} £#{price}\nOrder total: £#{price * 2}\n").to_stdout
    end
  end

  describe "#submit" do
    it "should confirm the order was submitted" do
      order.add(dish)
      allow(dish).to receive_messages(:name => name, :price => price)
      allow(phone_number).to receive(:match) { true }
      expect { order.submit(phone_number) }.to output("Order submitted\n").to_stdout
    end

    it "should set the order as complete" do
      order.add(dish)
      allow(dish).to receive_messages(:name => name, :price => price)
      allow(phone_number).to receive(:match) { true }
      order.submit(phone_number)
      expect(order).to be_complete
    end

    it "should not allow submission of empty orders" do
      expect { order.submit(phone_number) }.to raise_error "Please add at least one item to your order"
    end

    it "should not allow orders with invalid phone numbers" do
      order.add(dish)
      expect { order.submit("notanumber") }.to raise_error "Please enter a valid UK phone number"
    end
  end
end
