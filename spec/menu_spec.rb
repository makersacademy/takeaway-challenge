require 'menu'

describe Menu do

  subject(:menu) { described_class }
  let(:expected_menu) do
    {pizza: 10,
    ice_cream: 5.55,
    garlic_bread: 2.99}
  end

  it "should display the menu" do
    expect(menu.hash).to eq expected_menu
  end

end
