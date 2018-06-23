require 'takeaway'

describe TakeAway do

  describe "show dishes" do
    it { is_expected.to respond_to :show_menu }

    subject(:takeaway) { described_class.new }

    it "shows a list of dishes" do
      expect(takeaway.show_menu).to eq(takeaway.english_menu)
          end
        end
      end
