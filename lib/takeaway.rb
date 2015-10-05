class Takeaway

  attr_reader :menu

  def menu
    @menu = { 'pizza' => 10.00,
              'burrito' => 6.00,
              'burger' => 7.00,
              'chicken' => 5.00,
              'chips' => 2.00 }
  end
end
