require 'menu'



describe Menu do
  subject(:menu) { described_class.new }
  fakeOrder = [{ "Pie n Mash" => 2 }, 10.50] 

  it "has a list of dish types" do
    expect{ menu.print_menu }.to output(menu.print_menu).to_stdout
  end

  it "returns price of dishes" do
    expect(menu.mains["Pie n Mash"]).to eq 5.25
  end

  it "responds to place an order" do
    expect(menu).to respond_to :place_order
  end

  it "create a new order" do
    menu.place_order(fakeOrder)
    expect(menu.new_order.dish).to eq ({ "Pie n Mash" => 2 })
  end





end
