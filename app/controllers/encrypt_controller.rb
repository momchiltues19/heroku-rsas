require 'openssl'

class EncryptController < ApplicationController
	skip_before_action :verify_authenticity_token  
	def create
		key_id = params[:id]
		key = OpenSSL::PKey::RSA.new 200
		@help = Rsa.find(key_id)
		key.n = @help.n.to_i
    	key.e = @help.e.to_i
    	key.d = @help.d.to_i
		encrypt = key.public_encrypt(params[:message])
		encoded = Base64.strict_encode64(encrypt)
		@encrypted = Encrypt.new(message: encoded, id_message: key_id)
		@encrypted.save
		render plain: @encrypted.id
	end	
	
	def show
		@encrypted = Encrypt.find(params[:id])
		numbers = Hash.new
		numbers[:encrypted] = @encrypted.message
		render json: numbers
	end
end

