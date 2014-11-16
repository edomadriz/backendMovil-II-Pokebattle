#pokemon1 = Pokemon.create({:name=>'Bulbasor', :base_hp=>50, :base_type=>'Grass',
#			:height=>3, :weight=>8, :pokedex_number=>1, :attack=>'pichasote'})
#
#pokemon2 = Pokemon.create({:name=>'Charmander', :base_hp=>50, :base_type=>'Fire',
#			:height=>3, :weight=>8, :pokedex_number=>4, :attack=>'pichasote'})
#
#pokemon3 = Pokemon.create({:name=>'Squartle', :base_hp=>50, :base_type=>'Water',
#			:height=>3, :weight=>8, :pokedex_number=>7, :attack=>'pichasote'})
#
#pokemon4 = Pokemon.create({:name => 'Pikachu', :base_hp => 50, :base_type => 'Electric',
#			:height => 3, :weight => 8, :pokedex_number=>25, :attack=>'pichasote'})

for i in 1..151
	if i == 132
		puts "http://pokeapi.co/api/v1/pokemon/"+i.to_s
		@pokemon = HTTParty.get "http://pokeapi.co/api/v1/pokemon/"+i.to_s
		puts 'Name: '+@pokemon['name'].to_s
		puts 'Base HP: '+@pokemon['hp'].to_s
		puts 'Base Type: '+@pokemon['types'].first['name'].to_s
		puts 'Height: '+@pokemon['height'].to_s
		puts 'Weight: '+@pokemon['weight'].to_s
		puts 'Pokedex ID: '+@pokemon['pkdx_id'].to_s
		puts 'Attack: '+@pokemon['moves'].first['name'].to_s
		Pokemon.create({:name => @pokemon['name'], :base_hp => @pokemon['hp'],
			:base_type => @pokemon['types'].first['name'], :height => @pokemon['height'],
			:weight => @pokemon['weight'], :pokedex_number=>@pokemon['pkdx_id'],
			:attack=>@pokemon['moves'].first['name']})
	else
		puts "http://pokeapi.co/api/v1/pokemon/"+i.to_s
		@pokemon = HTTParty.get "http://pokeapi.co/api/v1/pokemon/"+i.to_s
		puts 'Name: '+@pokemon['name'].to_s
		puts 'Base HP: '+@pokemon['hp'].to_s
		puts 'Base Type: '+@pokemon['types'].first['name'].to_s
		puts 'Height: '+@pokemon['height'].to_s
		puts 'Weight: '+@pokemon['weight'].to_s
		puts 'Pokedex ID: '+@pokemon['pkdx_id'].to_s
		puts 'Attack: '+@pokemon['moves'][2]['name']
		Pokemon.create({:name => @pokemon['name'], :base_hp => @pokemon['hp'],
			:base_type => @pokemon['types'].first['name'], :height => @pokemon['height'],
			:weight => @pokemon['weight'], :pokedex_number=>@pokemon['pkdx_id'],
			:attack=>@pokemon['moves'][2]['name']})
	end
end





















































user1 = User.create({:name => 'Javier Saenz', :email => 'javier_22f@hotmail.com', :experience => 30, :base_pokemon => 1,
					:id_twitter => nil})

user2 = User.create({:name=>'Emmanuel Salazar', :email=>nil, :experience=>30, :base_pokemon=>4,
					:id_twitter=>'ersa92'})

user2 = User.create({:name=>'Gabriel Madriz', :email=>'edomadriz@gmail.com', :experience=>10, :base_pokemon=>0,
					:id_twitter=>nil})

pokedex1 = Pokedex.create({:user_id=>1})

pokedex2 = Pokedex.create({:user_id=>2})

pokedex2 = Pokedex.create({:user_id=>3})


pokemon_pokedex1 = PokemonPokedex.create({:pokedex_id=>1, :pokemon_id=>1})
pokemon_pokedex1 = PokemonPokedex.create({:pokedex_id=>1, :pokemon_id=>55})

pokemon_pokedex3 = PokemonPokedex.create({:pokedex_id=>2, :pokemon_id=>4})
pokemon_pokedex3 = PokemonPokedex.create({:pokedex_id=>2, :pokemon_id=>151})


battle1 = BattleRecord.create({:user_id=>1, :result=>1, :pokemon=>55, :date=>Time.now, :experience=>10})
battle2 = BattleRecord.create({:user_id=>1, :result=>0, :pokemon=>5, :date=>Time.now, :experience=>10})

battle8 = BattleRecord.create({:user_id=>2, :result=>1, :pokemon=>151, :date=>Time.now, :experience=>10})
battle9 = BattleRecord.create({:user_id=>2, :result=>0, :pokemon=>11, :date=>Time.now, :experience=>10})


