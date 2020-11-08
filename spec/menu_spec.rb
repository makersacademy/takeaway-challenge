require 'menu'

describe Menu do

  it "initializes with menu items" do
    expect(subject.menu).to eq Menu::MENU
  end

  it "displays a menu" do
    expect{ subject.view_menu }.to output.to_stdout
  end

  it "checks we have the dish" do
    expect{ subject.item_available?("Pizza") }.to raise_error "Error - don't think we have that. Have you checked your spelling?"
  end
  
end
