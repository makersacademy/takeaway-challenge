describe Menu do
  subject(:menu) { described_class.new }
  it "is a hash containing options" do
    expect(subject.options.class).to eq Hash
  end

  describe '#view_menu' do
    it "lets the customer see a list of all menu items with prices" do
      output_format = <<~HEREDOC
      Sesame prawn toast £5.79
      Crispy seaweed £3.99
      Spring rolls £2.99
      Lemon chicken £5.89
      King prawns with cashew nuts £6.99
      Steamed rice £4.0
      HEREDOC
      expect{menu.view_menu}.to output(output_format).to_stdout
    end
  end
end
