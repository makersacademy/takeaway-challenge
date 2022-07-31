require 'read'

MESSAGE = "bla bla bla".freeze

describe Read do
  it 'should read stdio-gets' do
    # mock_stdin = double("stdin_mock", :gets => MESSAGE)
    subject = Read.new
    allow(subject).to receive_message_chain(:gets, :chomp).and_return(MESSAGE)
    expect(subject.read_chomp).to eq(MESSAGE)
  end
end
