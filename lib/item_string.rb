require 'item'
module ItemString
  def self.str(item)
    "#{item.name} x #{item.quantity} = #{item.total}"
  end
end
