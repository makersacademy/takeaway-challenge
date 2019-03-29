require 'order'

describe Order do
  let(:order) { [{ dish: 'fish', price: 5 }] }
  
  it 'checks total of order' do
    expect(subject.check_total(order)).to eq 5
  end

  it 'sends a text' do
    expect(subject).to respond_to(:send_text)
  end
end


#class FakeSMS
  #Message = Struct.new(:from, :to, :body)

  #cattr_accessor :messages
  #self.messages = []

  #def initialize(_account_sid, _auth_token)
  #end

  #def messages
  #  self
  #end

  #def create(from:, to:, body:)
  #  self.class.messages << Message.new(from: from, to: to, body: body)
  #end
#end

#RSpec.configure. do |config|
  #config.before(:each) do
  #  stub_const("Twilio::REST::Client", FakeSMS)
  #end
#end
