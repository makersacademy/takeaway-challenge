require 'sms'

describe Sms do  
    subject(:text) {described_class.new}

  it "sends a confirmation text" do    
    expect(sms).to respond_to(:send) 
  end
end