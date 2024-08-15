require_relative 'versus.rb'

# This is main program

bf = BattleField.new
aai = Character.new("Aai", 55, 48, 0)
serina = Character.new("Serina", 60, 54, 0)
bf.join_to_battle(aai)
bf.join_to_battle(serina)
puts bf.to_s
puts "Battle start!"
# bf.attack_to_other_person("Serina", "Aai")
# bf.attack_to_other_person("Aai", "Serina")
# bf.attack_each_other("Serina", "Aai")
bf.attack_to_other_person("Aai", "Serina")
bf.attack_each_other("Serina", "Aai")
