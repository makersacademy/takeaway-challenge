require 'menu'

describe Menu do 

  it 'contains hash of items when initialized' do
    expect(subject).to respond_to :items
  end

  it 'has contains items when initialized' do
    expect(subject.items.count).to be > 0
  end




end
