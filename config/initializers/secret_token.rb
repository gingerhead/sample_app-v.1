# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#SampleApp::Application.config.secret_key_base = 'ecb727bc2b8d6f159ad4b0f4e91d2b53b44b577a50801b86e6bfcb1d6bbdccb33b4c23b3a5de9b228846e62a2106e33dc64a1c964c9ac00f69411b80d21b93fe'

require 'securerandom'

def secure_token
	token_file = Rails.root.join('.secret')
	if File.exist?(token_file)
		# Use existing token
		File.read(token_file).chomp
	else
		# Generate a new token and store it in token_file
		token = SecureRandom.hex(64)
		File.write(token_file, token)
		token
	end
end

SampleApp::Application.config.secret_key_base = secure_token