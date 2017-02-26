require 'menu'

describe Menu do
  it "initializes with an empty hash of items" do
    expect(subject.items).to be_empty
  end
end
