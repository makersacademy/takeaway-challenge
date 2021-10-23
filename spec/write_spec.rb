require 'write'
PRINTED_LIST= "['llll']".freeze

describe Write do
  it "should write" do
    allow(subject).to receive(:puts) { |arg| $argument = arg }
    subject.set_write(PRINTED_LIST)
    expect($argument).to eq(PRINTED_LIST)

  end
end