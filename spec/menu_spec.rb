require "menu"

describe Menu do
  subject { described_class.new }

  it "should have _something_ on the menu" do
    expect(subject.items).to_not be_empty
  end

  it "should be an iterable list of items" do
    expect(subject.items).to respond_to(:each)
  end
end
