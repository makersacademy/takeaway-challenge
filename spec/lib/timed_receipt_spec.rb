require 'timed_receipt'

describe TimedReceipt do
  subject(:docket) {described_class.new(items,total)}
  let(:items) { ["sausage, £1.23", "mushroom £2.34"] }
  let(:total) {"£3.57"}

  describe '#receipt' do
    it 'should return a receipt' do
      expect(docket.receipt).to respond_to(:chars)
    end
    it 'should contain list of items' do
      expect(docket.receipt).to include(items[0],items[1])
    end
    it 'should include total' do
      expect(docket.receipt).to include(total)
    end
    it 'should contain the time now' do
      expect(docket.receipt).to include(Time.now.strftime("%A %B %d %r"))
    end
    it 'should contain the time in an hour' do
      expect(docket.receipt).to include((Time.now+(60*60)).strftime('%r'))
    end
  end
end