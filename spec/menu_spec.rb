require 'menu'

describe 'Menu' do
  it 'is a hash' do
    expect(Menu.is_a?(Hash)).to be_truthy
  end

  it 'has corresponding prices for its items' do
    expect(Menu[:halloumi_fries]).to eq 5
  end

end