
describe Takeaway do
  subject (:takeaway) { Takeaway.new }

  it 'is a takeaway' do
    expect(takeaway).to be_a Takeaway
  end
end
