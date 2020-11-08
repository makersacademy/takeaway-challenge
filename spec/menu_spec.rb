require 'menu'

describe Menu do
  describe '#see_menu' do
    it 'prints the available dishes and their prices' do
      expect { subject.see_menu }.to output.to_stdout
    end
  end
end