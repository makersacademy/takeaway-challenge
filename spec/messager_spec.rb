require 'messager'

describe Messager do
  let(:person) {double :person, name: "Sergio", phone: "+441234567890"}
  subject(:messager) { described_class.new(person) }

  it "respond to person" do
    expect(messager).to respond_to (:person)
  end



end