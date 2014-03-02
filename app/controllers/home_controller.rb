#~ require 'trello'

class HomeController < ApplicationController
		before_filter :logged_in, :only => [:index]
		def trello_auth
				key = "d3d7c12c7047fd57f55953bd2e30e145"
				secret = "47322f44d31bd153c0c67773740fc7780f930328c02075d8d73aa423c87018ff"
				@consumer = OAuth::Consumer.new(key, secret, 
																								site: "https://trello.com",
																								request_token_path: "/1/OAuthGetRequestToken",
																								access_token_path: "/1/OAuthGetAccessToken",
																								authorize_path: "/1/OAuthAuthorizeToken" )				
				#~ puts @consumer.inspect
				
				@request_token = @consumer.get_request_token(oauth_callback: trello_callback_url)
				#~ puts @request_token.inspect
				
				session[:request_token] = @request_token
				#~ puts @request_token.authorize_url(name: "Test Application", oauth_callback: trello_callback_url).inspect
				
				redirect_to @request_token.authorize_url(oauth_callback: trello_callback_url, name: "Test Application")
		end
		
		#~ def trello_auth
				#~ redirect_to "https://trello.com/1/authorize?key=d3d7c12c7047fd57f55953bd2e30e145&name=My+Test+Applica&expiration=30days&response_type=token&callback_method=fragment&return_url=" + trello_callback_url
		#~ end
		
		def trello_auth_callback
				puts params.inspect
				request_token = session[:request_token]
				# Use the request token to make a request to the
				# access token path.
				@access_token  = request_token.get_access_token(oauth_verifier: params[:oauth_verifier])
				#~ puts "Access Token: #{@access_token.inspect}"
				session[:token] = @access_token.token
				session[:secret] = @access_token.secret
				
				trello_connection = TrelloConnector.new(@access_token.token, @access_token.secret)
				@member = trello_connection.trello_member("me")
				@boards = trello_connection.trello_boards
		end
		
		def dashboard
				trello_connection = TrelloConnector.new(session[:token], session[:secret])
				@member = trello_connection.trello_member("me")
				@boards = trello_connection.trello_boards
		end
		
		def index
		end

end
