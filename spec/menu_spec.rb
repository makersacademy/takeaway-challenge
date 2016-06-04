require "menu"

describe Menu do
  it "should have a list of menu items" do
    expect(subject.drinks).to_not be_empty
  end
end
