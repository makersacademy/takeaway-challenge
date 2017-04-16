require 'text'

describe Text do
  subject(:text) { described_class.new }

  it "adds an hour to the current time" do
    expect(text.plus_one_hour).to eq((Time.now  + (60*60)).strftime('%H:%M'))
  end
end
