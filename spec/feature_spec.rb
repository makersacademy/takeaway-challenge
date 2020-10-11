require 'restaurant'

describe "takeaway features" do

  let(:restaurant) {Restaurant.new}

  xit 'allows users to see the menu' do
    expect{restaurant.print_menu}.to output()
  end

end
