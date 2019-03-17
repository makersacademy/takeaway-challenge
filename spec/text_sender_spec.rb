require 'text_sender'
describe TextSender do
  describe '#send_text' do
    it { is_expected.to respond_to(:send_text).with(2).arguments }
  end
end
