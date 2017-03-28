require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:dish) {double(:dish)}
  let(:burger) {"Burger: £8"}
  let(:menu) {double(:menu)}

  it 'initializes with a new instance of Menu class' do
    takeaway.menu << dish
    expect(takeaway.menu).to include dish
  end

  it 'shows the menu as a string' do
    expect(takeaway.show_menu).to include burger
  end

end
