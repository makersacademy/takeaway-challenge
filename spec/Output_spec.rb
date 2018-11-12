require 'Output'

describe Sms do

  pending 'can send a message to a phone'

end

describe Screen do

  it 'can send a message to the screen' do
    message = "Hi!"
    expect { Screen.new(message) }.to output("#{message}\n").to_stdout
  end

end
