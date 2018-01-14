require "order"

describe Order do
  let(:time) {double :datetime, hour: 1, minute: 0}
  subject(:order) {described_class.new(time: time)}
  describe "#request" do
    
    it "returns order time, one hour later than 1:00" do 
      message =  "Thank you! Your order will be delivered at 2:00"
      expect(order.request("tofu 1, 5")).to eq message
    end

      it "returns order time, one hour later than 23:59" do 
      set_time(23, 59)	
      message =  "Thank you! Your order will be delivered at 0:59"
      expect(order.request("tofu 1, 5")).to eq message
    end



    def set_time(hour, minute) 
      allow(time).to receive(:hour).and_return(hour)
      allow(time).to receive(:minute).and_return(minute) 
    end
  end

end