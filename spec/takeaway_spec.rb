require 'takeaway'

describe Takeaway do

  let(:menu) { double :menu, dishes: { :spam => 1 } }
  subject(:takeaway) { described_class.new(menu) }

  it 'is an instance of Takeaway class' do
    expect(takeaway).to be_a(Takeaway)
  end

  it 'can be asked to show a menu' do
    expect(takeaway).to respond_to(:show_menu)
  end

  it 'can show the dishes and prices from a menu' do
    expect(takeaway.show_menu).to include(:spam)
  end
end
