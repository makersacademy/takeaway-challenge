require 'messaging'

describe Messaging do

it 'sends a message confirming the order' do
  expect(subject.send_message).to eq "Thank you! Your order was placed and will be delivered before 18:52"
end


end
