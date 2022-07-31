require "menu"

describe Menu do
  subject(:menu) { described_class.new }

  it "should display a list of menu items" do
    expect(menu.read_menu).to include "rice        £2"
  end

end
