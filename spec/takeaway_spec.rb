require 'takeaway'

describe Takeaway do
    
  let(:menu) { { "noodles" => 5, "chow mein" => 6, "spring rolls" => 7, "sweetsour" => 8, "crispybeef" => 9 } }
    
  it 'prints the menu for the customer' do
    expect(subject.print_menu).to include menu
  end
    
end
