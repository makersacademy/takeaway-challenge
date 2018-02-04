require "text"
require "Time"

describe Text do

  let(:example_text) {"Thank you! Your order was placed for £12 and "\
      "will be delivered before 21:06"}

  it 'Sends a message with time 1 hour later and passed in order value' do
    @time = Time.new(2018,6,21, 20,06)
    allow(Time).to receive(:now).and_return(@time)
    expect(subject.text_body(12)).to eql(example_text)
  end

end
