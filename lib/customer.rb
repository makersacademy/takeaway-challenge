class Customer
  attr_reader :name, :mobile

  def initialize(name: nil, mobile: nil)
    @name = name
    @mobile = mobile
  end
end
