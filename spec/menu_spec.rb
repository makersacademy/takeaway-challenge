require 'menu'

describe Menu do
  subject(:menu) {described_class.new}


  it "should give list of menu items" do
    allow(menu).to receive(:menu_list) {"Menu items"}
    expect(menu.menu_list).to eq "Menu items"
  end
end
