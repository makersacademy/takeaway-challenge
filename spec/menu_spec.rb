require 'menu'

describe Menu do
  it 'menu is a hash' do
    expect(subject.menu).to be_a Hash
  end

  it 'has a list of dishes and prices' do
    expect(subject.menu).to include("1. Roasted pork - £8")
  end
end
