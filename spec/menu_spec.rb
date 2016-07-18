require 'menu'

describe Menu do

  subject(:menu) { described_class.new(dishes) }
  let(:dishes) do { chicken: 3.99, chips: 2.99 } end

  it "prints the menu with dishes and prices" do
    expect(menu.print).to eq("chicken : 3.99, chips : 2.99")
  end

end
