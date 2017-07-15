require "order"

describe Order do
  subject(:order) { described_class.new }
  let(:dish) { double(:dish) }
  let(:name) { "Raw Vegan Lasagna" }
  let(:price) { 6 }
  let(:phone_number) { double(:string) }

  describe "initialization" do
    it "should initialize with an empty array of dishes" do
      expect(order.dishes).to be_empty
    end
  end

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
    it "should display the submitted order" do
      order.add(dish)
      allow(dish).to receive_messages(:name => name, :price => price)
      expect { order.submit(phone_number) }.to output("#{name} £#{price}\nOrder total: £#{price}\nOrder submitted\n").to_stdout
    end

    it "should not allow submission of empty orders" do
      expect { order.submit(phone_number) }.to raise_error "Please add at least one item to your order"
    end
  end
end
