require 'confirmation_text'

describe ConfirmationText do
  subject(:confirmation_text){described_class.new(client: client)}

  let(:client) {double(:client)}

  it 'sends a confirmation text with an estimated delivery time' do
    confirmation_text.send_text
  end
end
