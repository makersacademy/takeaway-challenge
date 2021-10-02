require 'menu'

describe Menu do 
    it 'responds to list method' do
        expect(subject).to respond_to(:list)
    end


end