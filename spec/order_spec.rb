require 'order'

describe Order do
  it { is_expected.to respond_to :display_menu}

  it { is_expected.to respond_to :add_to_order}

  it { is_expected.to respond_to :display_order}

  it { is_expected.to respond_to :checkout_order}

  describe '#display_menu' do
    it 'should display the menu with prices to the customer' do
      expect(subject.display_menu).to eq @list_of_dishes
    end
  end

  describe '#checkout_order' do
    it 'should confirm a order text message has been sent' do
      expect(subject.checkout_order).to eq "You will shortly receive a text confirming your order saying"
    end
  end

end
