require 'takeaway'

describe Takeaway do

  let(:menu) { { pizza: 10, burger: 6 } }

  describe '#check_menu' do
    it "displays menu" do
      expect(subject.check_menu).to include menu
    end
  end

end
