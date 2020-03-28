require 'menu'

describe Menu do 
  subject(:menu) {Menu.new({Pancakes: 5.5, Tea: 1})}

  context "#look_at_menu" do
    it "prints menu" do
     # expect(menu.look_at_menu).to eq ({Pancakes: 5 })
      expect{menu.look_at_menu}.to output("Pancakes: £5.50\nTea: £1.00\n").to_stdout
    end

  end
  it "#chooses(food)" do
     expect{menu.look_at_menu}.to output("Pancakes: £5.50\nTea: £1.00\n").to_stdout
   end
end 