require "text"

describe Text do

  it "should send a text" do
    allow(subject).to receive(:send).with(anything).and_return "Text sent"
  end
end
