require 'takeaway'

describe Takeaway do 

  subject(:takeaway) { described_class.new(menu: menu) }
    
  let(:menu) { double("menu") }
   
  it 'displays a menu showing the dishes and prices' do
    allow(menu).to receive(:view).and_return("Pizza: £11.99")
    
    expect(takeaway.view_menu).to eq("Pizza: £11.99")
  end
  
end