require 'menu'

describe Menu do
  it "stores the menu as an instance variable" do
    expect(subject.food).to be_an_instance_of Hash
  end

  it "responds to the view menu method" do
    expect(subject).to respond_to(:view_menu)
  end

  it "returns the menu as a string" do
    expect(subject.view_menu).to be_an_instance_of String
  end
end
