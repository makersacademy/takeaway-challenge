require 'messages'
describe Messages do
  number = "+15005550006"
  id = "AC83610dffc2aba0550cbeb134e7f7b61e"
  token = "b9761263fe46a5726a718486ca3a04d1"
  subject(:messages){described_class.new(number, id, token)}

  it 'sends text to a number' do
    expectation = {1_562_631_7216=>"Nick"}
    expect(messages.send_message).to eq expectation
  end
end
