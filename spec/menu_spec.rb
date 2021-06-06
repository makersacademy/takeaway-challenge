require 'menu'

describe 'MENU' do
  it 'is a hash' do
    expect(MENU.is_a?(Hash)).to be_truthy
  end

  it 'has corresponding prices for its items' do
    expect(MENU[:halloumi_fries]).to eq 5
  end

end
