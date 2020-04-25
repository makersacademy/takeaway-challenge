require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'should respond to #menu' do
    expect(menu).to respond_to(:menu)
  end
end
