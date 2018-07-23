require './lib/text_manager'

describe Text_manager do


  it 'responds to delivery time' do
    expect(subject).to respond_to (:delivery_time)
  end

  #Stub an external API
  it 'sends a text to my phone' do
     expect(subject).to receive(:send_text)
     subject.send_text
  end

end
