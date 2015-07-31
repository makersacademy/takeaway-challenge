require 'menu'

describe Menu do

  subject(:menu) { Menu.new }

  it "can have dishes added to it" do
    menu.add :burger, 9.99
    menu.add :chips, 1.99
    menu.add :coke, 0.99
    expect(menu.show).to eq "Burger - £9.99 // Chips - £1.99 // Coke - £0.99"
  end

  it "displays the menu in a pleasant format" do
    menu.add :burger, 9.99
    expect(menu.show).to eq "Burger - £9.99" # do not use subject?
  end

  it "gives the price of a particular item" do
    menu.add :burger, 9.99
    expect(menu.price_of :burger).to eq 9.99
  end

  xit "throws an error if that item is not on the menu" do

  end


end
