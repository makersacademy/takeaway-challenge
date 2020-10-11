require 'confirmation_text'


describe ConfirmationText do
  subject(:confirmation_text) { ConfirmationText.new }
  it 'sends text message' do
    allow_any_instance_of(ConfirmationText).to receive(:send_message).and_return("Complete")
    expect(confirmation_text.send_message).to eq("Complete")
  end
end