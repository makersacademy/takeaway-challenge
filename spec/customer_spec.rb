require 'customer'

describe Customer do

  let(:subject) { Customer.new("1234") }
    
  describe "#phone number" do
    it "should have a phone number" do
      expect(subject.phone_number).to eq "1234"
    end
  end 
end
