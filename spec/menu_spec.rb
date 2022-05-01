require 'menu'

describe Menu do

  context '#show' do
    it 'should display menu' do
      expect { subject.show }.to output("1. Chips - £1\n2. Tofu - £2\n3. Broccoli - £1\n4. Ice_cream - £2\n").to_stdout
    end
  end

end
