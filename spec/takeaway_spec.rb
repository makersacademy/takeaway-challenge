require 'takeaway'

describe Takeaway do
    it 'stores a menu' do
     expect(subject.menu).not_to be_nil
    end
end 
