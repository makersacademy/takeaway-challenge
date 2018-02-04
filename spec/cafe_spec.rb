require 'cafe'

describe Cafe do
  subject(:cafe) { described_class.new }

  it 'initializes an array of hashes' do
    expect(Cafe::ITEMS).to be_instance_of Array
  end

  it 'prints "ITEMS" constant to the console on request' do
    expect(cafe.print_menu).to eq Cafe::ITEMS
  end

  it '"ITEMS" constant contains keys and values, which can be manipulated' do
    expect(:"Buckwheat Shamalam" => 5.00).to have_key(:"Buckwheat Shamalam")
  end
end
