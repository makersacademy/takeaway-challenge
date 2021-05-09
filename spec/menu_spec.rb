require 'menu'

describe Menu do
  it 'has a empty menu by default' do
    expect(subject.items).to eq([])
  end
  it 'displays the menu' do
    expect(subject.display).to eq("[]")
  end
end