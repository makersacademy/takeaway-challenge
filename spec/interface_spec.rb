require 'interface'

describe Interface do
  describe "#launch" do
    it 'creates a reassurer and calls reassure on it' do
      ordertime = (Time.now + 3600).strftime("%H:%M:%S")
      expect(subject.finalize_order).to eq "Thank you! Your order was placed and will be delivered before #{ordertime}"
    end
  end
end
