require 'menu.rb'

describe Menu do
  subject(:menu) { described_class.new }

  it "menu.print returns a list of dishes and prices" do
    expect(menu.show).to eq({"Vindaloo" => 6, "Chips" => 3})
  end
end
