require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }
  let(:menu) { { "taco" => 2, "burrito" => 8 } }

  it 'has a menu' do
    expect(takeaway.menu).to be_a Menu
  end

  it 'is created with no orders' do
    expect(takeaway.orders).to be_empty
  end

  it 'can view a menu' do
    expect(takeaway.read_menu(menu)).to eq menu
  end

end
