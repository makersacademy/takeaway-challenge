require 'send_sms'
describe Sms do

  it 'gets time and sets delivery time' do
    actual_time = Time.new
    
    expect(subject.time).to eq "#{actual_time.hour + 1}:#{actual_time.min}"
  end
end
