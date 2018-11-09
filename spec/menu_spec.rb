require 'menu'

describe Menu do
  it 'should contain a list of menu items' do
    expect(subject.items).not_to be nil
  end
  describe '#view' do
    it 'should provide a list of dishes' do
      expect(subject).to respond_to(:view)
    end
  end
end
