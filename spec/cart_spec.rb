require "spec_helper"

describe Cart do
  let(:menu) { Menu.new }

  describe '#check' do
    it 'prints the contents of the cart to the screen in readable list' do
      # subject.select(1,2)
      expect { subject.check }.to output.to_stdout
    end
  end
end
