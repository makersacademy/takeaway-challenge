require 'interface'

describe Interface do

  before do
    @filepath = '/Users/malinnaleach/Programs/takeaway-challenge/lib/test.csv'
    @text = '/Users/malinnaleach/Programs/takeaway-challenge/lib/test.txt'
    @test_array = ["test"]
  end

  subject(:interface) {described_class.new(@filepath)}

  it 'should be able to output text from file' do
    expect(STDOUT).to receive(:puts).with("Testing testing\n")
    interface.file_reader(@text)
  end

  it 'shoud be able to output text from an array' do
    expect(STDOUT).to receive(:puts).with("test")
    interface.display(@test_array)
  end

end
