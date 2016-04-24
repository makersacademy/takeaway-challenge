require 'messager'

describe Messager do
  let(:person) {double :person, name: "Sergio", phone: "+441234567890"}
  subject(:messager) { described_class.new(person) }

  it "respond to person" do
    expect(messager).to respond_to (:person)
  end

  context('send text method') do
    before do
      allow(messager).to receive(:send_text)
    end
    it '#sends an order acknowledge SMS message' do
      expect(messager)
    end
  end
end