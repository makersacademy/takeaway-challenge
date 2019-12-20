require 'takeaway'

describe Takeaway do

  it 'should have a function to view the menu' do
    takeaway = Takeaway.new
    expect(takeaway).to respond_to(:menu)
  end

end
