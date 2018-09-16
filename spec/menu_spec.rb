require 'menu'

describe Menu do
  describe 'show' do
    it 'prints strings to the screen' do
      expect { subject.show }.to output.to_stdout
    end
  end
end
