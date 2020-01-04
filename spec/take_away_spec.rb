require "take_away"

describe Takeaway do
  subject(:takeaway) { describe_class.new(menu: menu) }
  let(:menu) { double(:menu) }

  it 'prints menu with dish and price' do

    expect(takeaway.print_menu).to eq('Pizza: £5.99')
  end
end
