require 'text'

describe Text do
  let(:text) { described_class.new }

  it 'calculates the current time, then adds one hour' do
    expect { text.calculating_time }.to change { text.delivery_hour }
  end

  it 'writes a message for the text' do
    allow(text.text_for_message).to receive(:calculating_time).and_return "22:15"
    output = "Thank you! Your order was placed and will be delivered before 22:15 Year: 9906. We hope you enjoy your average at best meal./n"
    expect { text.text_for_message }.to output(output).to_stdout
  end

end
