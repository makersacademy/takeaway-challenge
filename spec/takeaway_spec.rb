require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new}

  # let(:menu) { instance_double("Menu", view: printed_menu) }
  let(:printed_menu) {"1. Chop Sooy, With White Mushrooms: £2.5"}
  let(:menu) { double :menu }

  before do
    $stdin = StringIO.new("1")
  end

  it 'displays the menu with the available dishes and prices' do
    expect(menu).to receive(:view)
    # require 'pry'; binding.pry
    takeaway.view_menu
  end
end
