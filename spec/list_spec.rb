require "list.rb"


describe Menu do
  describe '#greet' do
    it 'greets a customer' do
      expect(subject.greet).to eq("Hi there! This is our menu for today: ")
    end
  end

describe Order do

    it "does not proceed initially" do
      dbl = double("Some order")
      expect(dbl).not_to receive(:proceed)
    end

    it "can proceed" do
      dbl = double("Some order")
      expect(dbl).to receive(:proceed)
      dbl.proceed
    end

    it "can accept order" do
      order = Order.new
      expect(order.take(["chicken", 3])).not_to be_nil

    end

    it "shows an order" do
      allow(Order).to receive(:show)
    end
end
    end
