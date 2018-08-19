require 'message_mod'
describe MessageMod do
  let(:dummy_class) { Class.new { include MessageMod } }
  let(:subject) { dummy_class.new }

  describe 'delivery time' do
    it 'returns the delivery time, 1 hour from now' do
      fake_time = Time.parse("19:30")
      allow(Time).to receive(:now) { fake_time }
      expect(subject.delivery_time).to eq '20:30'
    end
  end
end
