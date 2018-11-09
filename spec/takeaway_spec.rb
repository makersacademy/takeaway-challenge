require 'takeaway'
require 'menu'
require 'order'

describe Takeaway do
  describe '#view_menu' do
    it 'should respond to view_menu' do
      expect(subject).to respond_to(:view_menu)
    end
  end
  describe '#add_to_order' do
    it 'should respond to add_to_order' do
      expect(subject).to respond_to(:add_to_order)
    end
  end
  describe '#empty_basket' do
    it 'should respond to empty_basket' do
      expect(subject).to respond_to(:empty_basket)
    end
  end
  describe '#check_basket' do
    it 'should respond to check_basket' do
      expect(subject).to respond_to(:check_basket)
    end
  end
end
