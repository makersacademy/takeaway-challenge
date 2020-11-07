require 'menu'

describe Menu do

  it "initializes with menu items" do
    expect(subject.menu).to eq Menu::MENU
  end

  it "displays a menu" do
    expect{ subject.print}.to output.to_stdout
  end
end
