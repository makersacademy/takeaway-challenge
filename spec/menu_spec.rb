require 'menu'

describe Menu do
  it "creates a new instance of menu" do
    expect(subject).to be_an_instance_of Menu
  end

  it "initializes with a full menu" do
    expect(subject.dishes.length).to eq 5
  end
end
