require 'menu.rb'

describe 'menu' do
  subject(:menu) {described_class.new}

 it should 'return the restaurant_menu' do
   expect(:print_menu).to eq  "chocolate cake" => 3, "apple crumble" => 2,
     "brownie" => 1, "lemon drizze" => 4, "pear and apple" => 3
 end

end
