require "order"

describe Order do
  let(:time) {double :datetime, now: counter}
  let(:counter) {double :counter, strftime: "1:00"}
  subject(:order) {described_class.new}
  describe "#request" do
    
    it "returns order time, one hour later" do 
      message =  "Thank you! Your order will be delivered at 2:00"
      expect(order.request("tofu 1, 5")).to eq message
    end


  end

end