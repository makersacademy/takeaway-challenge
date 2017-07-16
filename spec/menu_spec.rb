require './lib/menu.rb'



describe Menu do
  subject(:menu) { described_class.new }

  it "has a list of dish types" do
    expect{ menu.print_menu }.to output(menu.print_menu).to_stdout
  end

    it "returns price of dishes" do
    expect(menu.dishes["Pie n Mash"]).to eq 5.25
  end


end
