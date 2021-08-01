require 'takeaway.rb'

describe Takeaway do 

  subject(:takeaway) { described_class.new(menu: menu) }

  let(:menu) { double(:menu, print: menu_list) }
  let(:menu_list) { "Tofu ramen: £2.99" }

  it 'shows menu list with prices' do
    expect(takeaway.display_menu).to eq("Tofu ramen: £2.99")
  end

end