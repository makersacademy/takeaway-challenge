require "order"

describe Order do
  let(:time) {double :datetime, hour: 1, minute: 0}
  let(:menu) {double :menu, choices: [tofu, daal]}
  let(:tofu) {double :option, food: "tofu", price: 5}
  let(:daal) {double :option, food: "daal", price: 7.50}

  subject(:order) {described_class.new(time, menu)}
 

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

  describe "#total" do
      it "should return order price of 0" do
        expect(order.total).to eq 0
      end
      
      context "order tofu first" do 
      before do 
        order.add("tofu", 2)
      end

      it "should return order price of 10" do 
        expect(order.total).to eq 10
      end

       it "should return order price of 17.50" do
       	   order.add("daal")
        expect(order.total).to eq 17.5
      end
     end
  end

  describe "#submit" do

  	it "raises error if try to order without anything in basket" do 
      message = "Order failed, nothing in basket"	
      expect{order.submit(0)}.to raise_error message
    end

  	 context "order two tofus one daal and first" do 
      before do 
        order.add("tofu", 2)
        order.add("daal")
      end

      it "returns order time, one hour later than 1:00" do 
        message =  "Thank you! Your order will be delivered by 02:00"
        expect(order.submit(17.5)).to eq message
      end

    it "returns order time, one hour later than 23:59" do 
      set_time(23, 59)	
      message =  "Thank you! Your order will be delivered by 00:59"
      expect(order.submit(17.5)).to eq message
    end

    it "raises error if you pay too little" do 
      message = "Order failed, you paid £15, your order cost £17.5. Try again"	
      expect{order.submit(15)}.to raise_error message
    end

     it "raises error if you pay too much" do 
      order.add("daal", 2)	
      message = "Order failed, you paid £30, your order cost £32.5. Try again"	
      expect{order.submit(30)}.to raise_error message
    end

    def set_time(hour, minute) 
      allow(time).to receive(:hour).and_return(hour)
      allow(time).to receive(:minute).and_return(minute) 
    end
   end
  end
end