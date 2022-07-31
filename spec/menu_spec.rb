require 'menu'

describe Menu do
  it 'can show you a list of dishes with prices' do
    expect(subject.display).to include ({dish: 'Fish', price: 9})
  end
end