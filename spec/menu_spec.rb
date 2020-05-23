
require 'menu'

describe Menu do
  it 'Should have a menu class' do
    expect(Menu).to respond_to(:new)
  end

  describe '#read' do
    it 'Should print out a list of items' do
      expect { subject.view }.to output.to_stdout
    end
  end
end
