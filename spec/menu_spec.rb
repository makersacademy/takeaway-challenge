require 'menu'

describe Menu do

  it 'is initialized with a hash of menu items' do
    expect(subject.list).to be_a Hash
  end

end