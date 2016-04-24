require "text"

describe Text do

  expect(subject).to receive(:send).with(1).argument.and_return "Text sent"

  it "should send a text" do
    expect(subject.send("Hi")).to eq "Text sent"
  end
end
