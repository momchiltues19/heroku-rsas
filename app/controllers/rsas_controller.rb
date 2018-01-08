require 'openssl'

class RsasController < ApplicationController
	protect_from_forgery except: :create
	def create
		if params[:n] && params[:e] && params[:d] then 
			key.n = params[:n].to_i
			key.e = params[:e].to_i
			key.d = params[:d].to_i
		else
			key = OpenSSL::PKey::RSA.new 2048
		end	
		@RSA = Rsa.new(n: key.n, e: key.e, d: key.d)
		@RSA.save
		redirect_to @RSA
	end
end
