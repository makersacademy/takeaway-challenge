require 'takeaway'
require 'order'
require 'menu'



describe Takeaway do

  let(:menu) { double(:menu, print: printed_menu) }
  let(:printed_menu) { {
    "Chicken_Katsu_Curry" => 13,
    "Veggie_Katsu_Curry" => 12,
    "Ramen" => 10,
    "Edamame" => 3,
    "Gyoza" => 5
     } }

  describe '#print_menu' do
    it 'prints a menu when called' do
    expect(subject.print_menu).to eq(printed_menu)
    end
  end
end
