class Api::UsersController < ApplicationController
	skip_before_filter  :verify_authenticity_token
	respond_to :json



	def index
		@users = get_user
		@userHash = {:users=>@users}
		respond_with @userHash

	end

	def show
		@user = find_user(params[:id])
		@userHash = {:user=>[@user]}
		respond_with @userHash
	end

	def show_user
		if params[:id_twitter].present?
			@user = find_user_twitter(params[:id_twitter])
		else
			@user = find_user_email(params[:email])
		end
		respond_with @user
	end

	def create
		if params[:email].present?
			@user = find_user_email(params[:email])
			if @user.nil?
				@user = User.new({:name=>params[:name], :email=>params[:email], :experience=>0, :base_pokemon=>0,
					:id_twitter=>params[:id_twitter]})
				@user.save
			end
		else
			@user = find_user_twitter(params[:id_twitter])
			if @user.nil?
				@user = User.new({:name=>params[:name], :email=>params[:email], :experience=>0, :base_pokemon=>0,
					:id_twitter=>params[:id_twitter]})
				@user.save
			end
		end

		respond_with @user do |format|
					format.json { render json: @user.to_json }
				end
	end

	def update
		puts params[:user_id]
		puts params[:pokemon]
		puts params[:email]

		@user = find_user(params[:user_id])
		@user.base_pokemon = params[:pokemon]
		@user.save

		@pokedex = get_pokedex(@user.id) 
		@pokedex = PokemonPokedex.create({:pokedex_id=>@user.pokedex.id, :pokemon_id=>params[:pokemon]})
		@pokedex.save

		respond_with @user do |format|
			format.json { render json: @user.to_json }
		end
	end
	
	private

	def get_user
		User.all
	end

	def find_user(id)
		User.find(id)
	end

	def get_pokedex(id)
		Pokedex.where(user_id: id).first
	end

	def find_user_email(email)
		User.where(email: email).first
	end

	def find_user_twitter(id_twitter)
		User.where(id_twitter: id_twitter).first
	end
end
