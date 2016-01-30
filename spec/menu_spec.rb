require 'menu.rb'

describe Menu do
  subject(:menu) { described_class.new }

  it 'initializes with a hash of dishes' do
    expect(menu.dishes).to be_a_hash
  end
end
