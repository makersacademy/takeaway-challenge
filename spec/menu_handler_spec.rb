describe Menu_handler do

  describe '#initialize' do
    let(:menu_handler) { described_class.new('fake_root/test')}

    it 'defaults the root' do
      expect(subject.instance_variable_get(:@root)).to eq described_class::ROOT
    end

    it 'defaults the root' do
      expect(menu_handler.instance_variable_get(:@root)).to eq 'fake_root/test'
    end

  end
end
