require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'should respond to #menu' do
    expect(menu).to respond_to(:menu)
  end

  it 'should print menu' do
    expect{ menu.print }.to output.to_stdout
  end
end
