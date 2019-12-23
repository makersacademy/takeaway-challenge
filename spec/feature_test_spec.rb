# require 'order'

# describe Order do
#   let(:menu) { Menu.new }
#   let(:Item) { Item.new }
#   let(:subject) { described_class.new(menu) }

#   before do 
#     menu.add_item(Item, "pizza", 8)
#     menu.add_item(Item, "burger", 10)
#     menu.add_item(Item, "chips", 3)
#   end
 
#   describe '#selection' do
#     context 'chooses to select a pizza and burger' do 
#       let(:user_input) { ["pizza\n",
#                            "burger\n",
#                            "\n"] 
#       }
#       let(:expected_output) { [:pizza,
#                                :burger] 
#       }
    
#       it 'returns selection' do 
#         set_user_input_and_check_expected_output
#       end
#     end
#   end

#   def set_user_input_and_check_expected_output
#     allow(STDIN)
#     .to receive(:gets).and_return(*user_input)
#     expect(subject.selection).to eq(expected_output)
#   end

# end
