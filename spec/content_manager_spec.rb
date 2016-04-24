require 'content_manager'

describe ContentManager do
  let(:person) {double :person, name: "Sergio", phone: "+441234567890"}
  subject(:cm) { described_class.new(person) }
  context('on initialization') do
    it 'respond to person' do
    expect(cm).to respond_to (:person)
    end
  end

  context('#set_eta') do
    before do
      @fake_time =  Time.new(2000,1,1,12,25)
      allow(Time).to receive(:now).and_return(@fake_time)
      @check_time = Time.new(2000,1,1,13,25)
    end
    it 'if order received at 12:25, ETA before 13:25' do
      expect(cm.set_eta).to eq @check_time
    end
  end
end