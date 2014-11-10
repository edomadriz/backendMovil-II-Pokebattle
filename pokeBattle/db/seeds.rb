pokemon1 = Pokemon.create({:name=>'Bulbasor', :base_hp=>50, :base_type=>'Grass',
			:height=>3, :weight=>8, :pokedex_number=>1, :attack=>'pichasote'})

pokemon2 = Pokemon.create({:name=>'Charmander', :base_hp=>50, :base_type=>'Fire',
			:height=>3, :weight=>8, :pokedex_number=>4, :attack=>'pichasote'})

pokemon3 = Pokemon.create({:name=>'Squartle', :base_hp=>50, :base_type=>'Water',
			:height=>3, :weight=>8, :pokedex_number=>7, :attack=>'pichasote'})

pokemon4 = Pokemon.create({:name => 'Pikachu', :base_hp => 50, :base_type => 'Electric',
			:height => 3, :weight => 8, :pokedex_number=>25, :attack=>'pichasote'})

user1 = User.create({:name => 'Gabriel', :email => 'edomadriz@gmail.com', :experience => 0, :base_pokemon => 0,
					:id_twitter => nil})

user2 = User.create({:name=>'Satcha', :email=>nil, :experience=>0, :base_pokemon=>0,
					:id_twitter=>'satchiss08'})

pokedex1 = Pokedex.create({:user_id=>1})

pokedex2 = Pokedex.create({:user_id=>2})


pokemon_pokedex1 = PokemonPokedex.create({:pokedex_id=>1, :pokemon_id=>4})
pokemon_pokedex2 = PokemonPokedex.create({:pokedex_id=>1, :pokemon_id=>1})

pokemon_pokedex3 = PokemonPokedex.create({:pokedex_id=>2, :pokemon_id=>2})
pokemon_pokedex4 = PokemonPokedex.create({:pokedex_id=>2, :pokemon_id=>3})

			