require 'takeaway'

let (:my_order) {Takeaway.new}

describe Takeaway do
  it 'creating a new instance of takeaway' do
    expect(my_order).to be_a Takeaway
  end



end
