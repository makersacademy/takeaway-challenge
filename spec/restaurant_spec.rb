require 'restaurant'

describe Restaurant do
  subject(:restaurant){Restaurant.new}
  it { is_expected.to respond_to(:twiliohelper) }
  let(:twiliohelper) { double(:twiliohelper)}

  describe '#confirm' do
    it 'triggers the confirmation process' do
      restaurant.twiliohelper = twiliohelper
      expect(twiliohelper).to receive :send
      restaurant.confirm
    end
  end
end
