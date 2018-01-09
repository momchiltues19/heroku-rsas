require 'openssl'

class RsasController < ApplicationController
	protect_from_forgery except: :create
	def index
	end
	def create
		if params[:n] && params[:e] && params[:d] then 
			key.n = params[:n].to_i
			key.e = params[:e].to_i
			key.d = params[:d].to_i
		else
			key = OpenSSL::PKey::RSA.new 200
		end	
		@RSA = Rsa.new(n: key.n, e: key.e, d: key.d)
		@RSA.save
		render plain: @RSA.id
	end
	def show
		key = Rsa.find(params[:id])
		numbers= Hash.new
		numbers[:n] = key.n
		numbers[:e] = key.e
		numbers[:d] = key.d
		render json: numbers
	end
end
