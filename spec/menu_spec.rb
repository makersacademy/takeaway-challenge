require "menu"

describe Menu do
  subject { described_class.new }

  it "should have a list of menu items" do
    expect(subject.items).to_not be_empty
  end
end
