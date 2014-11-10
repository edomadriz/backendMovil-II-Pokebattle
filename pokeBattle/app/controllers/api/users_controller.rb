class Api::UsersController < ApplicationController
	protect_from_forgery with: :null_session
	skip_before_filter  :verify_authenticity_token
	respond_to :json



	def index
		@users = get_user
		respond_with @user
	end

	def show
		@user = find_user(params[:email])
		respond_with @user
	end

	def create
		@user = find_user(params[:email])
		if @user.nil?
			@user = User.new({:name=>params[:name], :email=>params[:email], :experience=>0, :base_pokemon=>0})
			@user.save
			respond_with @user do |format|
				format.json { render json: @user.to_json }
			end
		end
	end

	def update
		@user = find_user(:email)
		@user.base_pokemon = params[:base_pokemon]
		@user.experience = params[:experience]
		@user.save

		respond_with @user do |format|
			format.json { render json: @user.to_json }
		end
	end
	

	private

	def get_user
		User.all
	end

	def find_user(email)
		User.where(email: email)
	end
end
