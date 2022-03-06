require 'delivery'
require 'time'
require 'order'

describe Delivery do
  describe "#confirmation" do
    it { is_expected.to respond_to(:confirmation)}
    
    before do
      @time = Time.new(2022, 3, 6, 20, 0, 0);
      allow(Time).to receive(:now).and_return(@time)
    end

    it "raises error if order is pending" do
      order = Order.new
      expect{subject.confirmation(order)}.to raise_error("Order pending!")
   end

  #   it "provides confirmation of delivery when order is accepted" do
  #     order = Order.new
  #     order.place_order
  #     expect{subject.confirmation(order)}.to output("Thank you! Your order was placed and will be delivered before 21:00\n").to_stdout
  #  end
  end
end