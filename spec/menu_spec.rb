require 'menu'

describe Menu do
  it 'has a empty menu by default' do
    expect(subject.items).to eq([])
  end
end