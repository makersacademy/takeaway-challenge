require 'takeaway'

describe Takeaway do

  it 'has a menu when created' do
    takeaway = Takeaway.new
    expect(takeaway.menu).to eq :chips => 2, :pizza=> 2, :water=>1
  end 
end