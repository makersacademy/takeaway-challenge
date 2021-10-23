require 'write'

describe Write do
  TEST_MESSAGE = "['llll']".freeze
  it "should writ message" do
    allow(subject).to receive(:puts) { |arg| $argument = arg }
    subject.write(TEST_MESSAGE)
    expect($argument).to eq(TEST_MESSAGE)
  end
end
