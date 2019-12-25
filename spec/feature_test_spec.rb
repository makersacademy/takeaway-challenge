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

require 'twilio-ruby'

account_sid = "AC6327e990bfbd4f31821c22b4bb2b94f8" # Your Test Account SID from www.twilio.com/console/settings
auth_token = "9939de6cf1b0dbc78ead14c18c082df8"   # Your Test Auth Token from www.twilio.com/console/settings

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.messages.create(
    body: "Hello from Ruby",
    to: "+447817762676",    # Replace with your phone number
    from: "+15005550006")  # Use this Magic Number for creating SMS

puts message.sid