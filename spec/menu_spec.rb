require 'menu'

describe Menu do

  describe '#initialize' do
    it 'should be an array' do
      expect(subject.current_menu).to be_a(Array)
    end

    it 'should have not be an empty array' do
      expect(subject.current_menu)
    end

    it 'should have a method that displays menu' do
      expect(subject).to respond_to(:display_menu)
    end
  end

  describe '#display_menu' do
    it 'should be an array' do
      expect(subject.current_menu).to be_a(Array)
    end

    it 'should return the menu' do
      expect(subject.display_menu).not_to be_empty
    end
  end
end
