require 'menu'

describe Menu do

  it 'should contain a hash of dishes with prices' do
    expect(subject.menu).to be_a(Hash)
  end

end
