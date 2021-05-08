require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu:menu) }
  let(:menu) { double :menu, display: "Garlic bread: £1.99" }
  
  it 'shows the list of dishes and prices' do 
    expect(takeaway.show_menu).to eq("Garlic bread: £1.99")
  end 
end