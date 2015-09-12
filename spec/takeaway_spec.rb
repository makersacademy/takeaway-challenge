require 'takeaway'

describe Takeaway do

  it 'should have a list of dishes available' do
    expect(subject).to respond_to(:menu)
  end

end
