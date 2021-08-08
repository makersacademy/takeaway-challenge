require 'takeaway'

describe Takeaway do

context 'checking that methods and variable exist' do
    
    it 'responds to menu' do
        expect(subject).to respond_to(:menu)
    end


    it 'responds to menu' do
        expect(subject).to respond_to(:print_menu)
    end

    it 'responds to menu' do
        expect(subject).to respond_to(:create_order)
    end
   #it 'responds to view_menu' do
   #    expect(subject).to respond_to(:view_menu)
   #end
#
   #it 'responds to create_order' do
   #    expect(subject).to respond_to(:create_order)
   #end
#
   #it 'responds to print_menu' do
   # expect(subject).to respond_to(:print_menu)
   #end
#
   #it 'responds to print_menu' do
   # expect(subject).to respond_to(:interactive_menu)
   #end
#
   #it 'responds to print_menu' do
   # expect(subject).to respond_to(:your_options)
   #end
#
   #it 'responds to print_menu' do
   # expect(subject).to respond_to(:process)
   #end
#
   #it 'responds to view_total' do
   # expect(subject).to respond_to(:view_total)
   #end
end



end


#it 'prints off the user options' do
    #        expect{subject.your_options}.to output(
    #            "1. View Menu\n2. Create Order\n3. View Total\n").to_stdout
    #    end
    #
    #    it 'menu returns the correct response from user input' do
    #        expect{subject.process(5)}.to output(
    #            "I don't understand. Please try again.\n"
    #        ).to_stdout
    #    end
    #
    #  end