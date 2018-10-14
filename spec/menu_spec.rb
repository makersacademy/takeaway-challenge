require 'menu'

describe Menu do

  it "shows the full menu" do
    menu = Menu.new
    expect(menu.view).to include("1. Chips Price £1.00")
  end

end
