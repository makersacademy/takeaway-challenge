require 'text'
describe Text do
  subject = Text.new("body","8:30\"")
  it "should add body" do
    expect(subject.body).to eq "body"
  end
  it "should add expected time" do
    expect(subject.expected_time).to eq "8:30\""
  end
  it "should add message" do
    expect(subject.message).to eq "body 8:30\""
  end
end
