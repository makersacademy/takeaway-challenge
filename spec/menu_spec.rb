require 'menu'

describe Menu do
  MENU_ITEMS = { "Pizza" => 10,
    "Pasta" => 12,
    "Spaghetti" => 8 }

  it "allows me to see a new menu" do
    expect(subject).to eq subject
  end

  it "allows me to list the items and prices on a menu" do
    expect(subject.print_menu).to eq "Pizza" => 10, "Pasta" => 12, "Spaghetti" => 8
  end

end
