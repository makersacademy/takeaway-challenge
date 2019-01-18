require 'reassurer'

describe Reassurer do
  describe "#reassure" do
    it 'returns a reassuring message' do
      ordertime = (Time.now + 3600).strftime("%H:%M:%S")
      expect(subject.reassure).to eq "Thank you! Your order was placed and will be delivered before #{ordertime}"
    end
  end
end
