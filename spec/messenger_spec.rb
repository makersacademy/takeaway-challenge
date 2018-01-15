require "messenger"  

describe Messenger do
  
  subject(:messenger) {described_class.new}

  describe "#confirmation" do

   it "returns order time, one hour later than 1:00" do 
        message =  "Thank you! Your order will be delivered by 02:00"
        expect(messenger.confirmation).to eq message
      end

    it "returns order time, one hour later than 23:59" do 
      message =  "Thank you! Your order will be delivered by 00:59"
      expect(order.submit(17.5)).to eq message
    end
   end
 end