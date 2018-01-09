class DecryptController < ApplicationController
	skip_before_action :verify_authenticity_token 
	def create
		key_id = params[:id]
		key = OpenSSL::PKey::RSA.new 200
		@help = Rsa.find(key_id)
		key.n = @help.n.to_i
    	key.e = @help.e.to_i
    	key.d = @help.d.to_i
    	decoded = Base64.decode64(params[:message])
    	decrypt = key.private_decrypt(decoded)
    	@decrypted = Decrypt.new(message: decrypt, id_message: key_id) 
		@decrypted.save
		render plain: @decrypted.message
	end 
end
