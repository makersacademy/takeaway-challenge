class Customer
  attr_reader :name, :mobile

  def initialize(name:, mobile:)
    @name = name
    @mobile = mobile.gsub(/\s/,'')
  end
end
