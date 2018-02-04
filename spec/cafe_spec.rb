require 'cafe'

describe Cafe do
  subject(:cafe) { described_class.new }

  describe '#initialize'
  it 'features a menu' do
    expect(cafe.menu).to be_instance_of Array
  end

  describe '#print_menu'
  it 'returns a menu of available items' do
    expect(cafe.print_menu).to eq cafe.items
  end
end
