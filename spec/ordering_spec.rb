require 'ordering'

describe Order do
  context 'with valid user input' do
    before do
      STDIN.stub(:gets).and_return("1\n")
    end

    it 'gets quantities from user input' do
      expect(subject.quantities).to be == "1"
    end

    it 'selects the right menu item' do
      allow(subject.make_order).to receive(:while).once
      expect(subject.make_order).to be true
    end
  end
end