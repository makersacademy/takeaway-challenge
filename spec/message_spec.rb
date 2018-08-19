require 'message'

describe Message do
  it "returns the time confirmed" do
    expect(subject.time.round(0)).to eq Time.new.round(0)
  end
end
