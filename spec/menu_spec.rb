require 'menu'

describe Menu do

  it "should store a menu" do

    expect(subject.menu).to eq({salad: 5, chips: 5, chicken: 8, steak: 10})
  end



end
