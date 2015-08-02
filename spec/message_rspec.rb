require 'phone'


describe Callcentre do

  let(:phone)     { Callcentre.new       }
  let(:my_number) { '+447930904641' }

  it 'should have a default number' do
    expect(phone.number).to eq Callcentre::DEFAULT_NUMBER
  end

  it 'can be given another number' do
    expect(Callcentre.new(my_number).number).to eq my_number
  end

  it 'can send an sms to another number' do
    msg = "Hi"; client = double :client, :account => nil
    allow(phone).to receive(:send_text).with(my_number, msg)
    phone.send_text(my_number, msg)
  end

end

