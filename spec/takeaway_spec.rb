require 'takeaway'

describe Takeaway do
  subject(:takeaway) {described_class.new}

  it 'displays the dishes that are available' do
    expect(takeaway.show_menu). to include ({"chips"=>2}) 
  end




end
