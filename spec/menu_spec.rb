require 'menu'

describe Menu do
    before(:each) do
        @menu = Menu.new
        @food_doub = double('food')
        @price_doub = double('price')
    end

    describe '#display'do
         it  {is_expected.to respond_to(:display)}
         it 'prints a menu' do
             expect(subject.display).to eq (subject.menu_list)
         end
     end

    describe '#add_food' do
        it {is_expected.to respond_to(:add_food).with(2).argument}
        it 'adds a food item to menu_list' do
            expect(@menu.add_food(@food_doub, @price_doub)).to eq (@price_doub)
        end
    end

    describe '#includes_item?' do
        it  {is_expected.to respond_to(:includes_item?).with(1).argument}
        it 'returns true if the menu contains a specific item' do
            expect(@menu.includes_item?('shrimp')).to eq true
        end
    end
end
