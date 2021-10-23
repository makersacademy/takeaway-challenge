require 'read'
MESSAGE = "bla bla bla"

describe Read do
  it 'should read stdio-gets' do
    mock_stdin= double("stdin_mock", :gets => MESSAGE)
    subject = Read.new(mock_stdin)
    expect(subject.read_chomp).to eq(MESSAGE)
  end
end
