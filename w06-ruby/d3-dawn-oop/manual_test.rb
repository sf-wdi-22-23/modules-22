require "./solutions/stretch.rb"

#### BASE CLASS ####
puts "\n#### BASE CLASS ####"


puts "\nRabbit of Caerbannog (test habitat)"
# rabbit = Monster.new
# # Rawr
# # 1 monsters now roam the world!
# rabbit.habitat = "Cave of Caerbannog"
# puts "habitat is #{rabbit.habitat}  (Cave of Caerbannog)"
# # habitat is Cave of Caerbannog

puts "\ndalek (test setting initial threat_level)"
# dalek = Monster.new(:high)
# # Rawr
# # 2 monsters now roam the world!
# puts "threat_level is #{dalek.threat_level} (high)"
# # threat level is high

puts "\nteletubby (test default threat_level)"
# teletubby = Monster.new
# # Rawr
# # 3 monsters now roam the world!
# puts "threat_level is #{teletubby.threat_level} (medium)"
# # threat level is medium

puts "\nyeti (test #habitat?)"
# yeti = Monster.new
# # Rawr!
# # 4 monsters now roam the world!
# yeti.habitat = "tundra"
# puts "yeti habitat is swamp: #{yeti.habitat?('swamp')} (false)"
# # yeti habitat is swamp: false
# puts "yeti habitat is tundra: #{yeti.habitat?('tundra')} (true)"
# # yeti habitat is tundra: true

puts "\n(test Monster.count getter)"
# puts "Monster count is #{Monster.count} (4)"
# # Monster count is 4

puts "\ncompassion? (test name instance variable)"
# rabbit.name = "Rabbit of Caerbannog"  # setter
# puts "name of rabbit is #{rabbit.name} (Rabbit of Caerbannog)"  # getter
# # name of rabbit is Rabbit of Caerbannog

puts "\nteletubby (medium) vs dalek (high) (test Monster.fight)"
# dalek.name = "dalek"
# teletubby.name = "teletubby"
# puts "winner is #{Monster.fight(teletubby, dalek).name} (dalek)"

puts "\nteletubby (medium) vs rabbit (medium) (test Monster.fight)"
# puts "winner is #{Monster.fight(teletubby, rabbit).name} (Rabbit of Caerbannog)"

#### INHERITANCE ####
puts "\n#### INHERITANCE ####"

puts "\nRob Zombie (test Zombie initialize)"
# rob = Zombie.new
# # Rawr!
# # 5 monsters now roam the world!
# rob.name = "Rob Zombie"	# also testing name getter and setter method inheritance
# puts "#{rob.name}'s habitat is #{rob.habitat} (graveyard)"
# # Rob Zombie's habitat is graveyard
# puts "#{rob.name}'s threat level is #{rob.threat_level} (medium)"
# # Rob Zombie's threat level is medium

puts "\nteen_wolf (test Werewolf initialize)"
# teen_wolf = Werewolf.new
# # Rawr!
# # 6 monsters now roam the world!
# puts "teen_wolf's threat_level is #{teen_wolf.threat_level} (low)"
# #teen_wolf's threat_level is low

puts "\nteen_wolf full moon (test Werewolf#update_threat_level)"
# puts "when full_moon is true, threat level returns #{teen_wolf.update_threat_level(true)} (midnight)"
# # when full_moon is true, threat level is midnight
# puts "... threat_level is set to #{teen_wolf.threat_level} (midnight)"
# # threat_level is set to midnight
# puts "when full_moon is false, threat level returns #{teen_wolf.update_threat_level(false)} (low)"
# # when full_moon is false, threat level is low
# puts "... threat_level is set to #{teen_wolf.threat_level} (low)"
# # threat_level is set to low

puts "\n(test class descriptions)"
# puts "Monster class: #{Monster.class_description}"
# puts "Zombie class: #{Zombie.class_description}"
# puts "Werewolf class: #{Werewolf.class_description}"

#### MODULES ####
puts "\n#### MODULES ####"

puts "\nvamp (test Vampire, with Flying module)"
# vamp = Vampire.new
# # Rawr!
# # 7 monsters now roam the world!
# vamp.fly
# # it soars through the air
# puts "inherited vampire threat level is #{vamp.threat_level} (medium)"
# # inherited vampire threat level is medium

puts "\ndracula (test Vampire / Flying with name)"
# dracula = Vampire.new(:high)
# # Rawr!
# # 8 monsters now roam the world!
# dracula.name = "Count Dracula"
# dracula.fly  
# # Count Dracula soars through the air

#### STRETCH ####
puts "\n#### STRETCH ####"

puts "\nMonster::THREAT_LEVELS (test exists)"
# p Monster::THREAT_LEVELS
# # [:low, :medium, :high, :midnight]

puts "\nMonster::THREAT_LEVELS (test can't modify / frozen)"
# # test will rescue error so it doesn't crash program
# begin
# 	Monster::THREAT_LEVELS.push(:friendly)
# rescue RuntimeError => err
#   puts "! caught RuntimeError: #{err}"
# end
# # ! caught RuntimeError: can't modify frozen Array


puts "\n(test invalid threat_level)"
# begin
#   rubber_ducky = Monster.new(:friendly)
# rescue RuntimeError => err
#   puts "! caught RuntimeError: #{err}"
# end
# # ! caught RuntimeError: cannot create monster - invalid threat level friendly

puts "\n(test Comparable)"
# rubber_ducky = Monster.new(:low)
# rubber_ducky.name = "ducky"
# # Rawr!
# # 9 monsters now roam the world!
# teen_wolf.name = "Michael"
# teen_wolf.update_threat_level(true)
# monster_array = [
# 	rubber_ducky,  # :low
# 	rob,  # :medium
# 	dalek,  # :high 
# 	teen_wolf # :midnight
# ]
# puts "\nshuffling monsters:"
# p monster_array.shuffle!
# puts "\nsorted by Ruby using <=>"
# p monster_array.sort!
# puts "(expected order is ducky, Rob Zombie, dalex, Michael)"

