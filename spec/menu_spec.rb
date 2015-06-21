require 'menu'

describe Menu do

  subject(:menu) { Menu.new }

  it "displays the menu" do
    expect(menu.show).to eq "1 - Burger - £9.99" # do not use subject?
  end

end
