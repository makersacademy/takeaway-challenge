require 'message'
describe Message do
  subject(:message) { described_class.new }
  it 'creates an instance variable for @my_number' do
    expect(subject.my_number).to eq('+447510060718')
  end
  it 'creates an instance variable for @time' do
    expect(subject.time).not_to be(nil)
  end
end
