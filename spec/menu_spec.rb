require 'menu'

describe Menu do
  context '#display' do
    it 'displays a list of menu items' do
      expect(subject.display).to be_a(String)
    end
  end
end
