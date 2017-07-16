require './lib/menu.rb'



describe Menu do
  subject(:menu) { described_class.new }

  it "has a list of dish types" do
    expect{ menu.print_menu }.to output(menu.print_menu).to_stdout
  end

  it "returns price of dishes" do
    expect(menu.dishes["Pie n Mash"]).to eq 5.25
  end

  it "responds to place an order" do
    expect(menu).to respond_to :place_order
  end

  it "saves a new order" do
    new_order = { "Pie n Mash" => 2 }
    menu.place_order(new_order)
    expect(menu.order).to eq new_order
  end





end
