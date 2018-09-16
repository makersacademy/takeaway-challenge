require "menuFormatter"

describe MenuFormatter do
  let(:item) { double :item }
  let(:price) { double :price }
  let(:menu) { [{ :item => item, :price => price }] }

  describe '#format' do
    it 'prints the menu in the right format' do
      expect { subject.format(menu) }.to output("#{item}, #{price}\n").to_stdout
    end
  end

end
