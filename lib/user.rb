require 'restaurant'
require 'menu'
require 'takeaway'

class User

attr_reader :user_info

  def initialize
   @user_info = {"name"=>"Rachael",
     "number"=>"00447411252150"}
  end

end
