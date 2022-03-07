require 'menu'

describe Menu do

  it "starts off with no items" do
    expect(subject.show_menu).to eq([])
  end

  it "adds a dish to the menu" do
    subject.add_dish_to_menu("spaghetti bolognese", 12)
    expect(subject.show_menu).not_to be_empty
  end

  it "creates a set menu" do
    subject.create_set_menu
    expect(subject.show_menu.length).to eq(6)
  end

  it "can find a dish from the menu" do
    subject.create_set_menu
    expect(subject.find_dish("Spaghetti Bolognese")).to eq(subject.show_menu[0])
  end
end
