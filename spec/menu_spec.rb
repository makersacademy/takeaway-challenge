require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  it 'creates an instance of a class' do
    expect(menu).to be_a(Menu)
  end
end
