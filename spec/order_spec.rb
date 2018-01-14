require "order"

describe Order do
  let(:time) {double :datetime, hour: 1, minute: 0}
  let(:menu) {double :menu, choices: [tofu]}
  let(:tofu) {double :option, food: "tofu", price: 5}

  subject(:order) {described_class.new(time: time, menu: menu)}
 

  describe "#add" do
  	  
  	  it "when you order an item, its stored in the list" do
       order.add("tofu")
       expect(order.list).to eq [tofu]
      end

      it "you can order two lots of a food in one go" do
        order.add("tofu", 2)
        expect(order.list).to eq [tofu, tofu]
      end

      it "raises error when you order something not on the menu" do
        expect { order.add("chicken", 2) }.to raise_error("Not on menu")
      end


  end

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