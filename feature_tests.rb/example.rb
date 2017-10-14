2.4.0 :001 > require './lib/takeaway.rb'
^[[A^[[A => true
2.4.0 :002 > require './lib/twilio.rb'
 => true
2.4.0 :003 > t = Takeaway.new
 => #<Takeaway:0x007f8c8cab9990 @menu={"curry"=>1.0, "xcurry"=>1.0}, @basket={}>
 t.select_dish("curry", 1)
 => 1.0
2.4.0 :005 > t.select_dish("xcurry", 1)
 => 1.0
2.4.0 :006 > t.empty_basket
 => {}
2.4.0 :007 > t
 => #<Takeaway:0x007fc5c0262a68 @menu={"curry"=>1.0, "xcurry"=>1.0}, @basket={}>
2.4.0 :008 > t.select_dish("xcurry", 1)
 => 1.0
2.4.0 :009 > t
 => #<Takeaway:0x007fc5c0262a68 @menu={"curry"=>1.0, "xcurry"=>1.0}, @basket={"xcurry"=>1.0}>
2.4.0 :010 > t.empty_basket
 => {}
2.4.0 :004 > t.select_dish("curry", 1)
 => 1.0
2.4.0 :005 > t.select_dish("xcurry", 1)
 => 1.0
2.4.0 :006 > t.place_order(2.0)
 => "SM2f1f1f2e11b24afb843d9bd68c265c20"
