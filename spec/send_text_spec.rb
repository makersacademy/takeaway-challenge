require 'send_text'
describe SendText do
    it { is_expected.to respond_to(:send, :message)}
end