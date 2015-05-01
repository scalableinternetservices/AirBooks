class AccountController < ApplicationController
	before_action :set_book, only: [:show, :edit, :update, :destroy]
  	before_filter :authenticate_user!

  	def home
  	end

  	
end
