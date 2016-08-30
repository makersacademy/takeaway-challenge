require 'confirm'

describe Confirm do
  it 'has a method to send order confirmation texts' do
    expect(subject).to respond_to(:send_text)
  end
end
