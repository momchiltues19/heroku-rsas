Rails.application.routes.draw do
	resources 'rsas', only: [:show]
	post '/rsas/:id/encrypt_messages/', to: 'encrypt#create'
	get '/rsas/:id_message/encrypt_messages/:id', to: 'encrypt#show'
	post '/rsas/:id/decrypt_messages/', to: 'decrypt#create'
end
