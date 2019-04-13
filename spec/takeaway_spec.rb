require 'takeaway'

describe Takeaway do
  let(:tel) { double :tel }
  let(:Tel_Info) { double :tel_info }
  let(:takeaway_phone) { phone = double :takeaway_phone
                         allow(phone).to receive(:send_sms) do |_arg1, _arg2|
                           text = "Thank you! Your order was placed and will be delivered before"
                           "#{text}  #{(Time.now + 3600).strftime('%H:%M')}"
                         end
                         phone
  }

  subject { described_class.new(takeaway_phone) }

  describe '#menu' do
    it 'show the menu' do
      expect(subject.menu).to eq({
        spring_rolls: 4.55,
        grilled_dumpling: 4.9,
        chicken_fried_rice: 6.95,
        won_tom: 7.95,
        curry_breef_brisket: 7.95,
        coke: 1.2,
        ice_tea: 2.55
      })
    end
  end

  describe '#take_order' do
    it 'take order from customer input' do
      subject.take_order({
      spring_rolls: 2,
      won_tom: 1,
      ice_tea: 3
    }, tel)

      expect(subject.order). to eq(
        {
        spring_rolls: 2,
        won_tom: 1,
        ice_tea: 3
        }
      )
    end

    it 'validate whether the dish is available' do
      expect { subject.take_order(
        { spring_rolls: 2,
          won_tom: 1,
          beer: 2,
          }, tel)
      }      .to raise_error(RuntimeError) { "bear is not available" }
    end

    it 'validate whether the dishes are available' do
      expect { subject.take_order({
        spring_rolls: 2,
        beef_steak: 1,
        beer: 2,
        }, tel)
      }      .to raise_error(RuntimeError) { "beef_steak and bear are not available" }
    end

  end

  describe '#order_match?' do
    let(:subject) {
      subject = described_class.new(takeaway_phone)
      subject.take_order({
      spring_rolls: 2,
      won_tom: 1,
      ice_tea: 3
      }, tel)
      subject
    }

    it " return true when given number match the sum of ordered dishes" do
      expect(subject.order_match?(6)).to eq true
    end

    it " return false when given number not match the sum of ordered dishes" do
      expect(subject.order_match?(4)).to eq false
    end
  end

  context 'When make a order' do

    it 'send a messge to user' do
      order_time = Time.new(2019, 4, 13, 20, 20)
      allow(Time).to receive(:now).and_return(order_time)
      msg = "Thank you! Your order was placed and will be delivered before 21:20"
      expect(takeaway_phone).to receive(:send_sms).and_return(msg)

      subject.take_order({ chicken_fried_rice: 2 }, tel)
    end
  end

end
