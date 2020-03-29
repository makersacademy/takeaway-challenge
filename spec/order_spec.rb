require 'order'

describe Order do 
  #*  need to make a make a mock for Menu class 
  let(:menu) {Menu.new(Pancakes: 5.5, Tea: 1, Eggs: 3.35)}
  let(:order) {[{ food: :Pancakes, price: 5.5, amount: 1}, {food: :Tea, price:2, amount: 2}]}
  #let(:menu_double) { double("anything", working?: true) } # true = stub working? method     method : what you want it to return 
  #subject(:menu) {Menu.new(Pancakes: 5.5, Tea: 1, Eggs: 3.35)}
# 



  context "#look_at_menu" do
    it "prints menu" do
    # expect(menu.look_at_menu).to eq ({Pancakes: 5 })
      subject.open_menu(menu)
      expect{subject.look_at_menu}.to output("Pancakes: £5.50\nTea: £1.00\nEggs: £3.35\n").to_stdout
    end
  end 


    context "#choose(food_input,amount)" do
      it "user can choose food items and select how much of each items they need from menu" do
        subject.open_menu(menu)
        subject.choose("Pancakes", 1)
        subject.choose("Tea", 2)
        expect(subject.order).to eq [{food: :Pancakes, price: 5.5, amount: 1}, {food: :Tea, price:2, amount: 2}]
      end
    end 

    context "#print_order" do 
      it 'prints order' do
        subject.open_menu(menu)
        subject.choose("Pancakes", 1)
        subject.choose("Tea", 2)
  
        #! fix formating of price 
        expect{subject.prints_order}.to output("food: Pancakes, amount: 1, price: £5.5\nfood: Tea, amount: 2, price: £2\n£7.5\n").to_stdout
      end 
    end 

    
    # order double = 
    context "#total" do
      it 'calculates total price of food' do 
        subject.open_menu(menu)
        subject.choose("Pancakes", 1)
        subject.choose("Tea", 2)
        expect(subject.total).to eq 7.5
      end 
    end 
  end