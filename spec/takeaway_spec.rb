require 'takeaway'

describe Takeaway do

  let(:takeaway) { Takeaway.new }
  let(:dish)     { double :dish , price: 2  }
  
  it "should be able to display a menu" do
    takeaway.menu_update(dish)
    expect(takeaway.menu).to eq({:dish => 2})
  end 
end