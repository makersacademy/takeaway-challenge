require 'text'

describe Text do
  subject(:text) {described_class.new}

  it "sends a confirmation text" do
    expect(text).to respond_to(:send)
  end

  
end
