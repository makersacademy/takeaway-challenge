require 'menu'

describe Menu do

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
            expect(subject.view_basket).not_to be_empty
        end
    end

end