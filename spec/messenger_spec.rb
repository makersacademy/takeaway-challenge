require 'messenger'

describe Messenger do

  it "should respond to confirm_order method" do
    expect(subject).to respond_to(:send_confirmation)
  end

  it "should send a message" do
    expect(subject.send_confirmation("message")).to eq "Confirmation's been sent" 
  end

end
