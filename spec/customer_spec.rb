require 'customer'

describe Customer do 
    subject { Customer.new("Rob", "07713836331") }
    it 'should be instance of customer' do
        expect(subject).to be_an_instance_of(Customer)
    end

    it 'should have a name' do
        expect(subject.name).to eq "Rob"
    end

    it 'should have a phone number' do
        expect(subject.number).to eq "07713836331"
    end
end