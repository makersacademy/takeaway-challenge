require './lib/menu.rb'

describe Menu do

  subject(:menu) { described_class.new(dishes)}
  let(:dishes) do
    { Egg: 1.00,
      Eggs: 2.00}
  end

   it "Has an accessible menu" do
     expect(menu.dishes).to eq(dishes)
  #   expect(takeaway.menu).to eq ({ "egg" => 1, "two eggs" => 2, "three eggs"=> 3, "four eggs" => 4, "five eggs" => 5})
   end

   it "prints dishes" do
     printed_menu = "Egg £1.00, Eggs £2.00"
     expect(menu.print).to eq(printed_menu)
   end


end
