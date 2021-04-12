require 'menu'

describe Menu do
  subject(:menu) { described_class.new}

  it ' has dishes' do
    expect(menu.print).to include("Burger")
  end
  it ' has prices' do
    expect(menu.print).to include(10.to_s)
  end
end