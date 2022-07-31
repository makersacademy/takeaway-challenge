require 'menu'

describe Menu do
  subject(:menu) { described_class.new}

  it ' has dishes' do
    expect(menu.print).to include("Burger")
  end
  it ' has prices' do
    expect(menu.print).to include(10.to_s)
  end
  it 'knows if has the dish' do
   expect(menu.has_dish?(:Pizza)).to be true 
  end
  it 'knows if doenst have the dish' do
  expect(menu.has_dish?(:Lobster)). to be false
end
end