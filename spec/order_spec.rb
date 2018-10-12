describe Order do
  let(:menu) { double :menu, :items => {"Margarita Pizza" => 8, "Hamburger" => 6, "Chips" => 2} }
  context '#add' do
    it 'adds an item to the order' do
      subject.add("Margarita Pizza")
      expect(subject.total).to eq 8
    end
  end
end
