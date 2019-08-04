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
  end
end
