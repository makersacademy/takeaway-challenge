require 'takeaway'

describe Takeaway do

context 'checking that methods and variable exist' do
    
    it 'responds to menu' do
        expect(subject).to respond_to(:menu)
    end

    it 'responds to print menu' do
        expect(subject).to respond_to(:print_menu)
    end

    it 'responds to create_order' do
        expect(subject).to respond_to(:choose_item)
    end

   it 'responds to get_item' do
       expect(subject).to respond_to(:get_item)
   end
end

context 'checking to see that input results in the desired output' do

    #it 'expects choose item to receive a user input' do
    #item = double
    #allow(subject.choose_item).to receive(:gets).and_return(item)
    #expect{subject.choose_item}.to_return(subject.get_item(item))
    #end

end 

end

#end
