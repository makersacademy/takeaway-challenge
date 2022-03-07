require 'order'

describe Order do

  let(:menu) {Menu.new}
  let(:subject) { Order.new(menu)}

  it "starts off with no items" do
    expect(subject.basket).to eq([])
  end

  it "can add a dish" do
    menu.create_set_menu
    expect(subject.add_to_basket("Spaghetti Bolognese")).to eq([menu.show_menu[0]])
  end

  it "displays correct basket subtotal" do
    menu.create_set_menu
    subject.add_to_basket("Butter Chicken")
    subject.add_to_basket("Beef Stroganoff")
    expect(subject.show_basket_subtotal).to eq("Your basket costs £36.98")
  end

  it "will not check out if basket is empty" do
    expect { subject.check_out }.to raise_error
  end
end
