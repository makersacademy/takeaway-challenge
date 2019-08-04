require 'formatter'

context 'Test formatting of time and money inputs' do
  describe Formatter do

    let(:formatter){ described_class.new }

    it "changes pence input to readable output" do
      expect(formatter.format_change(100)).to eq("1.00")
    end

    it 'converts time to readable 4 character format' do
      timestamp = Time.now
      expect(formatter.delivery_time_reformat(timestamp).length).to eq(5)
    end

    it 'adds an hour to time to give delivery time' do
      timestamp = Time.new(2002, 10, 31)
      expect(formatter.delivery_time_reformat(timestamp)).to eq("01:00")
    end

    it 'Can reset 24 hour clock when adding hour at 23' do
      timestamp = Time.utc(2000,"jan",1,23,15,1)
      expect(formatter.delivery_time_reformat(timestamp)).to eq("00:15")
    end
  end
end
