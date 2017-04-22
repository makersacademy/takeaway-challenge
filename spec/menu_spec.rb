require './lib/menu'

describe Menu do
    
    it { is_expected.to respond_to(:dishes) }
    
    it { is_expected.to respond_to(:add_dish).with(2).arguments }
    
    describe '#dishes' do
        it 'Returns an empty list of dishes' do
            expect(subject.dishes).to be_empty
        end
    end
end