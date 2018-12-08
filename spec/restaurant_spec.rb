require 'restaurant'

describe Restaurant do 

let(:restaurant) {Restaurant.new}

it "responds to #show_menu" do
expect(restaurant).to respond_to(:show_menu)
end 

end