require 'menu'

describe Menu do

  it "initialises a new instance of the Menu class" do
    expect(subject).to be_a Menu
  end

  it "contains a list of dishes with prices" do
    expect(subject.menu).to be_a Hash
    expect(subject.menu["Fried rice"]).to be_a Numeric
  end

  it "responds to a method called view_menu" do
    expect(subject.menu).to respond_to(:view_menu)
  end

end
