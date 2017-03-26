require 'restaurant'
require 'stringio'

describe Restaurant do

  subject(:restaurant) { described_class.new }
  before { $stdin = StringIO.new("Nandos")}
  # after { $stdin = STDIN }

  it 'has a list of restaurant' do
    expect(restaurant.list).not_to be_empty
  end

  context 'prints the list of restaurants' do
    specify{ expect{ subject }.to output.to_stdout }
  end
end
