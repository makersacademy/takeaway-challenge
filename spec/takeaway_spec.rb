require 'takeaway'

describe Takeaway do

  let(:takeaway) { Takeaway.new            }
  let(:dish)     { double :dish , price: 2, name: 'dish' }

  before do
    takeaway.menu_update(dish)
  end
  
  it "should be able to display a menu" do
    expect(takeaway.menu).to eq({'dish' => '2£'})
  end 

  it "should be able to show the dishes selected and the total price" do
    takeaway.order
    expect(takeaway.dishes_selected).to eq(['dish'])
    expect(takeaway.total_price).to eq(2)
  end

end