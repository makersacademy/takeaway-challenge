require 'takeaway'

describe Takeaway do

context 'checking that methods exist' do
    
   it 'responds to view_menu' do
       expect(subject).to respond_to(:view_menu)
   end

   it 'responds to create_order' do
       expect(subject).to respond_to(:create_order)
   end

end

# context 'checking that methods function as required' do 
# 
#     let(:new_array) { new_array = [{item: "Chilli", price: 6}, {item: "Hot dog", price: 3}] }
# 
# 
#     #subject.new_array.create!(item:"Cheese", price: 3)
#       
#     puts :new_array
# 
# 
#     before(:each)(:new_array = new_array) end
#       #before do
#       #  assign(:new_array, new_array)
#       #end
# 
#     it 'prints out the faked menu' do
#         expect(subject.print_menu).to eq("1. Chilli, 6\n2. Hot dog, 3")
#     end
# 
# end

end

#   before(:each){subject.new_array :new_array, [
#        {item: "cheese",
#        price: 6}
#    ]}

    #before(:each)(new_array = new_array)
#    let(:new_array){[{item: "cheese",
#        price: 6}
#    ]}