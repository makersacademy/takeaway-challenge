require "takeaway"

describe Takeaway do 
  it 'is expected to respond to menu emthod ' do 
    expect(subject).to respond_to(:menu)
  end 
end
