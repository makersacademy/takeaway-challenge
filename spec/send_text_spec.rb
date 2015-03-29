require 'send_text'

context 'Text delivery confirmation' do
  before do
    message = MessageKlass.new
  end

  it 'fails if there is no customer number given and order to deliver' do
    expect { message.send_text }.to raise_error
  end

  xit 'succeeds otherwise' do
  end
end
