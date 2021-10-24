require 'write'

TEST_MESSAGE = "['llll']".freeze

describe Write do
  it "should writ message" do
    allow(subject).to receive(:puts) { |arg| $argument = arg }
    subject.write(TEST_MESSAGE)
    expect($argument).to eq(TEST_MESSAGE)
  end
end
