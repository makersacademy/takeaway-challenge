require 'order'

describe Order do 
  #*  need to make a make a mock for Menu class 
  let(:menu) {Menu.new(Pancakes: 5.5, Tea: 1, Eggs: 3.35)}
  let(:order_small) {[{ food: :Pancakes, price: 5.5, amount: 1}, {food: :Tea, price:2, amount: 2}]}
  let(:order_large) {[{ food: :Pancakes, price: 5.5, amount: 1}, {food: :Tea, price:2, amount: 2},{food: :Eggs, price: 6.70, amount: 2}]}
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

    context "#place_order" do 
      it 'prints order' do
        subject.open_menu(menu)
        subject.choose("Pancakes", 1)
        subject.choose("Tea", 2)
  
        #! fix formating of price 
        expect{subject.place_order(order_small)}.to output("food: Pancakes, amount: 1, price: £5.5\nfood: Tea, amount: 2, price: £2\n£7.5\n").to_stdout
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

    context "#verify" do 
      it 'if the final sum is not the same as the sum when the the order was placed throw an error ' do
        subject.open_menu(menu)
        subject.choose("Pancakes", 1)
        subject.choose("Tea", 2)
        expect{subject.place_order(order_small)}.to output("food: Pancakes, amount: 1, price: £5.5\nfood: Tea, amount: 2, price: £2\n£7.5\n").to_stdout
        subject.choose("Eggs", 2)
        expect(subject.total).to eq 14.2
        expect{subject.verify}.to raise_error "total does not equal prints_order" 
      end 
      it 'if the final sum is the same as when the order is placed sent a text message' do
        subject.open_menu(menu)
        subject.choose("Pancakes", 1)
        subject.choose("Tea", 2)
        expect{subject.place_order(order_small)}.to output("food: Pancakes, amount: 1, price: £5.5\nfood: Tea, amount: 2, price: £2\n£7.5\n").to_stdout
        expect(subject.total).to eq 7.5
        expect{subject.verify}.to output("send text\n").to_stdout
      end
    end

  end

=begin
  it '#top_up fails if over balance' do
    expect{ card.top_up(95) }.to raise_error "Over limit"
  end
=end 