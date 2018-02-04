require 'takeaway'

describe Takeaway do

  let(:takeaway) { described_class.new }

  describe '#print_menu' do
    it 'returns menu to stdout' do
      expect{takeaway.print_menu}.to output.to_stdout
    end
  end

end
