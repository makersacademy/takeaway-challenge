require 'confirmation'
describe ConfirmText do
  it { is_expected.to respond_to(:send_text) }
  context '#send_text' do
    subject(:text) { described_class.new }
    it "Should send txt" do
      expect(text).to receive(:send_text)
      text.send_text
    end
  end
end
