require 'takeaway'

describe Takeaway do 

    let(:item) { double :dish }

    it 'contains a menu with food and prices that can be read with the #menu method' do
    expect(subject.menu).to include({"Cheeseburger" => 3.15})
    end

    # describe '#print(menu)' do

    #   it 'can print the menu line by line with the item and price next to each other' do
    #     menu = subject.menu
    #     expect{ subject.print(menu) }.to output("Double Double: $4.35\nCheeseburger: $3.15\nHamburger: $2.85\nFrench Fries: $2.05\nMilkshake: $2.45\nSmall Soda: $1.75\n").to_stdout
    #  end
    # end

    describe 'order(item)' do
      it 'adds an item to the basket' do
      subject.add(item)
      expect(subject.basket).to include(item)
      end
    end 
    

    describe '#basket' do
        it 'begins as an empty array' do
        expect(subject.basket).to be_empty
        end 
    end

end
        
            

