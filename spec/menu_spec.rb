require 'menu'

describe Menu do
  it 'saves menu items into a list' do
    subject.display
    expect(subject.list.count).to eq(9)
  end

  it 'saves all menu prices' do
    subject.display
    expect(subject.prices.count).to eq(9)  
  end
end