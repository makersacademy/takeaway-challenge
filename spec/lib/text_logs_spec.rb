require 'text_logs'

describe TextLogs do
  subject(:logs) { described_class.new }
  let(:client) do double(:client,
    each: [1,2,3,4],
    from: [],
    body: [])
  end


  describe '#run_logs' do
    it 'should collect logs from client' do
      expect(logs.run_logs(client)).to eq [1, 2, 3, 4]
    end
  end

  describe '#received' do
    it 'should return logs when called' do
      logs.run_logs(client)
      expect(logs.received).to eq "--- []\n"
    end
  end
end