require 'menu'

describe Menu do

    menu = Menu.new
    item1 = Item.new(1, "Eggs and Turnips", 10)
    item2 = Item.new(2, "Cheese, Carrot and Marzipan", 12)
    item3 = Item.new(3, "Pear, Pork and Parmisan", 20)
    item4 = Item.new(4, "Cabbage on Toast", 90)
    menu.instance_variable_set(:@menu_items, [item1, item2, item3, item4])


    it 'initialises without error' do
        expect{subject}.not_to raise_error
    end

    describe 'build_menu' do
        it 'adds items to menu' do
            subject.build_menu
            expect(subject.instance_variable_get(:@menu_items)).not_to be_empty
        end
    end

    describe 'view' do
        it 'displays list of menu items' do
            subject.build_menu
            expect(subject.view).not_to be_empty
        end
        it 'displays list of menu items2' do
            menu.instance_variable_set(:@menu_items, [item1])
            # subject.build_menu
            expect(menu.view).to eq [item1]
        end
    end

    describe 'add_to_basket' do
        it 'responds to 2 arguments' do
            expect(subject).to respond_to(:add_to_basket).with(2).arguments
        end
        it 'can add item on menu to basket' do
            subject.add_to_basket(1, 2)
            expect(subject.instance_variable_get(:@basket)).to include {{item: instance_variable_get(:@menu_items)[0], quantity: 2}}
            p subject.instance_variable_get(:@basket)
        end
    end

    describe 'total' do
        it 'returns accurate total' do
            subject.add_to_basket(1, 2)
            expect(subject.total).to eq 20
        end
    end

    describe 'view_basket' do
        it 'shows contents of basket' do
            subject.add_to_basket(1, 2)
            expect(subject.view_basket).to include {{item: instance_variable_get(:@menu_items)[0], quantity: 2}}
        end
    end

    describe 'checkout' do
        it 'sends confirmation message to user' do
            allow(subject.checkout).to receive_messages(1234,1234) do 
                expect (subject.checkout).to include "Thank you! Your order was placed"
        end
    end

end