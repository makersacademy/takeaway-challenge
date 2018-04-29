require 'menu'
describe Menu do

  describe '#list_dished' do
    it 'responds to list_dishs' do
      expect(subject).to respond_to(:list_dishes)
    end
  end

  describe '#contains?(dish)' do
    it 'responds to contains?(dish)' do
      expect(subject).to respond_to(:contains?)
    end
  end
end
