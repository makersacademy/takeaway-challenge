require 'customer'

describe Customer do

  subject {Customer.new(12345)}

  it { is_expected.to be_instance_of(Customer)}

  describe "#view_menu" do
    it 'displays menu to user' do
      heredoc = <<~HEREDOC
        Chips £1.50
        Battered sausage £2.20
        Pastie supper £4.29
        Chicken goujons £2.59
        Fish supper £4.80
      HEREDOC
      expect(subject.view_menu).to eq(heredoc)
    end
  end
end
