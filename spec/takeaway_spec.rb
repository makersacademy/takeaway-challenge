require_relative '../lib/takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, display: display_menu) }
  let(:display_menu) { 'Chicken Tikka Masala: £6.50' }

  it 'displays menu with list of dishes and prices' do
    expect(subject.display_menu).to eq(display_menu)
  end
end
