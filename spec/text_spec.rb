require 'text'

describe Text do
  it "executes text delivery without error" do
    expect(Text.confirmation).to eq "confirmation message sent"
  end
end
