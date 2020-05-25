require 'takeaway'

describe TakeAway do
  let(:takeaway) { TakeAway.new }
  let(:menu) { Menu.new }
  let(:food) { :food }

  it 'should have a user scrutable menu' do
    expect(subject.menu).not_to be nil
  end

  it "shows the user the menu" do
    expect(subject.seemenu).to eq [{ :food => "dimsum", :price => 3 }, { :food => "soup", :price => 4 }, { :food => "rice", :price => 7 }]
  end

  it "responds to order with any args" do
    expect(takeaway).to respond_to(:order).with(2).arguments
  end

  # it "returns the order" do
  #   takeaway.order(food, ammount)
  #   expect(takeaway.see_order).to eq([[:food]])
  # end

end
