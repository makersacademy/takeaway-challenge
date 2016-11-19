require './lib/menu'

describe Menu do

  let(:menu) { described_class.new }

  it "is expected to initialize with a list of food" do
    expect(menu.menu_list).not_to be_empty
  end

  it "can present a user with the list of food" do
    expect(menu.view_menu).to eq menu.menu_list
  end

  it "can present a price against a dish" do
    expect(menu.menu_list[:spag_bol]).to eq 6
  end



end
