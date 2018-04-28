describe Menu do
  it { is_expected.to respond_to(:list) }

  describe '#list' do
    it 'should return message if the menu is empty' do
      expect { subject.list }.to output("The menu is empty\n").to_stdout
    end
  end
end
