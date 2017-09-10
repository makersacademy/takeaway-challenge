require 'menu'

RSpec.describe Menu do

  describe '#show' do
    it 'displays the menu' do
      expect(subject.show).to eq "Welcome to the Catnip emporium:\nThis is our menu"
    end
  end
end
