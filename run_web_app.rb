require 'sinatra'
require 'sinatra/reloader'
require './caesar_cipher.rb'

enable :sessions

get "/" do
	plaintext  = session.delete(:plaintext)
	key        = session.delete(:key)
	ciphertext = session.delete(:ciphertext)
	erb :form, { :locals => { 
	                    :plaintext => plaintext,
	                    :key => key,
	                    :ciphertext => ciphertext }	}
end

post "/" do
	plaintext  = params["plaintext"]
	key        = params["key"]
	ciphertext = caesar_cipher(plaintext, key.to_i)

	session["plaintext"]  = plaintext
	session["key"]        = key
	session["ciphertext"] = ciphertext
	redirect "/"
end
