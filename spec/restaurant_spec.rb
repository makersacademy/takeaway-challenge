require 'restaurant'
require 'stringio'

describe Restaurant do

  subject(:restaurant) { described_class.new }
  before { $stdin = StringIO.new("Nandos")}
  # after { $stdin = STDIN }

  it 'has a list of restaurants' do
    expect(restaurant.list).not_to be_empty
  end

  it 'has an empty menu' do
    expect(restaurant.menu).to be_instance_of Hash
  end

  context 'prints the list of restaurants' do
    specify{ expect{ subject }.to output.to_stdout }
  end
end
