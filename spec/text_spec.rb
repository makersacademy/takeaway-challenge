require './lib/text.rb'

describe Text do 
  let(:text) { described_class.new }

  it "creates text instance" do 
    expect(text).to eq(text)
  end 

  it "responds to confirm order method" do 
    expect(text).to respond_to(:confirm_order)
  end 
end 