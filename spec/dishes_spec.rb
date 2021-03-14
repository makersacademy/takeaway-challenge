require 'dishes'

describe Dishes do
  describe '#list dishes' do
    it 'putses menu to STDOUT' do
      expect { subject.list_menu }.to output.to_stdout
    end
  end
end
