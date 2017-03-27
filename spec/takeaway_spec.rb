require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}
  let(:dish) {double(:dish)}
  let(:menu) {double(:menu)}

  it 'initializes with a new instance of Menu class' do
    takeaway.menu << dish
    expect(takeaway.menu).to include dish
  end

  # it 'shows the menu as a string' do
  #   expect(takeaway.show_menu).to include dish
  # end

end
