require 'textmessage'

describe Textmessage do
  subject(:textmessage) { described_class.new }
  it' should send message to the customer' do
  expect(textmessage.deliver.body).to include "Thank you! Your order was placed and will be delivered before "
end
end
