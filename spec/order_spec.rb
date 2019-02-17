require_relative '../lib/order'

describe Order do
  let(:order) { Order.new }

  describe '.add' do
    it 'selected dishes are added to order' do
      expect { order.add(10, 2) }
        .to change { order.selected_dishes }
        .to include({ quantity: 2, dish: "Small Fries", price: 1.00, subtotal: 2.00 })
    end
  end

  before do
    order.add(4, 1)
    order.add(5, 1)
    order.add(10, 2)
  end

  describe '.total' do
    it 'returns the total' do
      expect(order.total).to eq 5.35
    end
  end

  describe '.print_total' do
    it 'outputs the total cost of the order' do
      expect(order.print_total).to eq "\u00A35.35"
    end
  end

  describe '.review' do
    let (:order_summary) {
      order_summary = ""
      
      order_summary << "Order Summary:\n\n"
      order_summary << "Veggie Burger\n"
      order_summary << "\u00A32.75 each, x1, subtotal: \u00A32.75\n\n"
      order_summary << "Small Lemonade\n"
      order_summary << "\u00A30.60 each, x1, subtotal: \u00A30.60\n\n"
      order_summary << "Small Fries\n"
      order_summary << "\u00A31.00 each, x2, subtotal: \u00A32.00\n\n"
      order_summary << "             GRAND TOTAL: \u00A35.35"

      order_summary
    }

    it 'displays order summary' do
      expect(order.review).to eq order_summary
    end

    it 'raises error if GRAND TOTAL and actual total do not match' do
      expect{order.review(9.5)}.to raise_error ("Error: GRAND TOTAL does not match actual total value of dishes.")
    end
  end

  describe '.submit' do

    # Need to figure out how to test that submit is actually able to call Submission

    let (:submission_dbl) { double(:submission_dbl, order: order ) }

    let (:submission_class) { double(:submission_class, new: submission_dbl) }

    it 'calls Submission to submit the order' do
      allow(order).to receive(:submit).and_return(submission_dbl)
      expect(order.submit).to eq (submission_dbl)
    end
  end
end
