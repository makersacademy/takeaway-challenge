require 'message'

describe Message do


  subject(:text){described_class.new(:from,:to, :body)}

  it "should have a number to send to" do
    expect(text.to).to eq :to
  end

  it "should have a number to send a message from" do
    expect(text.from).to eq :from
  end

  it "should have a default message" do
    expect(text.body).to eq :body
  end
end
