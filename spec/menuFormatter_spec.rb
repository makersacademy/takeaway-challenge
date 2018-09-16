require "menuFormatter"

describe MenuFormatter do
  let(:dish) { double :dish }
  let(:price) { double :price }
  let(:menu) { [{ :dish => dish, :price => price }] }

  describe '#format' do
    it 'prints the menu in the right format' do
      expect { subject.format(menu) }.to output("#{dish}, #{price}\n").to_stdout
    end
  end

end
