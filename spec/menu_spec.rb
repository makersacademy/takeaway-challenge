require 'menu'

describe Menu do 
  subject(:menu) {Menu.new(Pancakes: 5.5, Tea: 1, Eggs: 3.35)}

  context "#look_at_menu" do
    it "prints menu" do
    # expect(menu.look_at_menu).to eq ({Pancakes: 5 })
      expect{menu.look_at_menu}.to output("Pancakes: £5.50\nTea: £1.00\nEggs: £3.35\n").to_stdout
    end
  end 


    context "#choose(food_input,amount)" do
      it "user can choose food items and select how much of each items they need from menu" do
        menu.choose("Pancakes", 1)
        menu.choose("Tea", 2)
        expect(menu.order).to eq [{food: :Pancakes, price: 5.5, amount: 1}, {food: :Tea, price:2, amount: 2}]
      end
    end 

    context "#total" do
      it 'calculates total price of food' do 
        menu.choose("Pancakes", 1)
        menu.choose("Tea", 2)
        expect(menu.total).to eq 7.5
      end 
    end 

  context "#print_order" do 
    it 'prints order' do
      menu.choose("Pancakes", 1)
      menu.choose("Tea", 2)
      menu.total
      #! fix formating of price 
      expect{menu.prints_order}.to output("food: Pancakes, amount: 1, price: £5.5\nfood: Tea, amount: 2, price: £2\n£7.5\n").to_stdout
      
    end 
  
  end
  

end
