require "text"

describe Text do
  let(:body) {"Your order is on it's way! Total: £0 It will be delivered by 9:00"}
  
  it "should send a text" do
    allow(subject).to receive(:send).with(anything).and_return("Text sent")
  end
end
