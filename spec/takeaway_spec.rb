require 'takeaway'

describe Takeaway do 

    it 'contains a menu with food and prices that can be read with the #menu method' do
    expect(subject.menu).to include({"Cheeseburger" => 3.15})
    end

    describe '#print(menu)' do

      it 'can print the menu line by line with the item and price next to each other' do
        menu = subject.menu
        expect{ subject.print(menu) }.to output("Double Double: $4.35\nCheeseburger: $3.15\nHamburger: $2.85\nFrench Fries: $2.05\nMilkshake: $2.45\nSmall Soda: $1.75\n").to_stdout
     end
    end

    describe '#Order' do
      let(:fakeaway) { double = Takeaway.new }
      
      it 'receives user input as an order' do
        menu = fakeaway.menu
        allow(fakeaway).to receive(:gets).and_return("Cheeseburger") 
        fakeaway.order(menu)
        expect(fakeaway.basket).to include("Cheeseburger")
      end
    end
        
            

end