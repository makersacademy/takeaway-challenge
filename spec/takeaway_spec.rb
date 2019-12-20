require 'takeaway'

describe Takeaway do

  it 'should have a function to view the menu' do
    takeaway = Takeaway.new
    expect(takeaway.menu).to be_an_instance_of(Array)
  end

end
