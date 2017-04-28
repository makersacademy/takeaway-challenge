require './lib/menu'

describe Menu do
    
    it { is_expected.to respond_to(:dishes) }
    
    it { is_expected.to respond_to(:add_dish).with(2).arguments }
    
    describe '#dishes' do
        it 'Returns an empty list of dishes' do
            expect(subject.dishes).to be_empty
        end
    end
    
    describe '#add_dish' do
        it 'Stores new dishes in the dishes array as a hash' do
            subject.add_dish("Hash Browns", 4.50)
            expect(subject.dishes).to include( {:dish => "Hash Browns", :price => 4.50} )
        end
    end
end