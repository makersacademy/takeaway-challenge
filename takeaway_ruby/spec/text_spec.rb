require "text"

describe Text do 

  describe ".text" do 
    it "should create a text using a template and the order passed as an argument" do 
      order = double("order")
      expect(subject.text(order)).to be_a String
    end
    it "should calculate the delivery time as one hour after order was placed" do 
      order = double("order")
      subject.text(order)
      expect(subject.time).to eq ((Time.new + 1 * 60 * 60).strftime("%H:%M"))
    end
  end
end
