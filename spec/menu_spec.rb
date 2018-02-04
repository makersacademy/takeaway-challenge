require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  it 'contains a hash of food options and prices' do
    expect(menu.options).to be_a Hash
  end

  it 'prints a menu' do
    expect { menu.print_centered } .to output.to_stdout
  end
end
