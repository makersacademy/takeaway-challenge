require 'list'

describe List do
    it 'should have an empty list of dishes when initialized' do
        expect(subject.dishes).to be_empty
    end
end