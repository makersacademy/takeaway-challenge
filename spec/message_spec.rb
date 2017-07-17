require 'message'

describe Message do

  context '#send_message' do

    it { is_expected.to respond_to(:send_message) }

    it 'sends text message to customer' do
    end
  end
end
