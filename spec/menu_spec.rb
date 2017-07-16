require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it "shows the dishes on the menu" do
    expect(menu.list_dishes).to include "salad" => 5
  end

  it { is_expected.to respond_to(:list_dishes) }
end
