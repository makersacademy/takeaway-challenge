require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  it 'contains a hash of food options and prices' do
    expect(menu.options).to be_a Hash
  end


end
