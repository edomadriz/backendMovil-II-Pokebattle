class Api::UsersController < ApplicationController
	skip_before_filter  :verify_authenticity_token
	respond_to :json



	def index
		@users = get_user
		respond_with @users
	end


	def show_user
		puts 'aqui'
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
		if params[:email].present?
			@user = find_user_email(:email)
			@user.base_pokemon = params[:base_pokemon]
			@user.experience = params[:experience]
			@user.save
		else
			@user = find_user_twitter(:id_twitter)
			@user.base_pokemon = params[:base_pokemon]
			@user.experience = params[:experience]
			@user.save
		end

		respond_with @user do |format|
			format.json { render json: @user.to_json }
		end
	end
	

	private

	def get_user
		User.all
	end

	def find_user_email(email)
		User.where(email: email)
	end

	def find_user_twitter(id_twitter)
		User.where(id_twitter: id_twitter)
	end
end
