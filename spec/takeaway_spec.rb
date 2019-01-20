require "takeaway"

describe Takeaway do 
  subject(:my_order) {described_class.new}
  # let(:menu) { double(:menu) }
  it 'is expected to respond to menu method ' do 
    expect(my_order).to respond_to(:check_menu)
  end 

end
