require 'kitchen'



describe Kitchen do
  subject(:kitchen) { described_class.new }
  fakeOrder = [{ "Pie n Mash" => 1, "Bangers n Mash" => 2  }, 19.75]

  it "has a list of dish types" do
    expect{ kitchen.print_menu }.to output(kitchen.print_menu).to_stdout
  end

  it "returns price of dishes" do
    expect(kitchen.mains["Pie n Mash"]).to eq 5.25
  end

  # it "responds to place an order" do
  #   expect(menu).to respond_to :place_order
  # end

  it "create a new order" do
    kitchen.create_order(fakeOrder)
    expect(kitchen.new_order.dish).to eq ({ "Pie n Mash" => 1, "Bangers n Mash" => 2 })
  end





end
