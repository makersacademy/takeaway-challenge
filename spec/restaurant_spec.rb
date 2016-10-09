require "spec_helper"

describe Restaurant do
  let(:menu) {Menu.new}

  describe '#initialize' do
    it 'to create a new menu' do
      expect(subject.menu.class).to eq(Menu)
    end
  end

  describe '#menu' do
    it { expect(subject).to respond_to(:menu) }
  end
end
