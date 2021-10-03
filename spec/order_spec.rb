require 'order'

describe Order do

  it "has a list of dishes on creation" do
    expect(subject.items).to be_a(Array)
  end
end
