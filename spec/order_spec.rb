require 'order'

describe Order do 
    it 'should be a type of order' do 
        expect(subject).to be_an_instance_of(Order)
    end 

    it 'should have an empty order list' do 
        expect(subject.order_list).to eq([])
    end
end