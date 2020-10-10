require 'restaurant'

describe "takeaway features" do

  let(:restaurant) {Restaurant.new}

  xit 'allows users to see the menu' do
    expect{restaurant.see_menu}.to output()
  end

end
