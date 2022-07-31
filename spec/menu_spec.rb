require "menu"

describe Menu do
  subject(:menu) { Menu.new }

  it "should be an instance of class menu" do
    expect(menu).to be_instance_of Menu
  end
end
