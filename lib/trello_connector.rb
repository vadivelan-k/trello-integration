require 'rubygems'
require 'trello'

class TrelloConnector
		attr_accessor :status
		def initialize(oauth_token, oauth_secret, consumer_key = "d3d7c12c7047fd57f55953bd2e30e145", consumer_secret = "47322f44d31bd153c0c67773740fc7780f930328c02075d8d73aa423c87018ff")
				@status = true
				begin
						Trello.configure do |config|
								config.consumer_key = consumer_key
								config.consumer_secret = consumer_secret
								config.oauth_token = oauth_token
								config.oauth_token_secret = oauth_secret
						end
				rescue
						@status = false
				end
		end
		
		def trello_member(user_name)
				puts 222222222
				# Sample object mockup
				#<Trello::Member:0x318bc40 @attributes={:id=>"530d32d869b003730ed35e5a", :username=>"vadivelan1", :email=>nil, :full_name=>"vadivelan", :initials=>"V", :avatar_id=>"a5962e0cead65c58eb1fdf7698f5c1b1", :bio=>"", :url=>"https://trello.com/vadivelan1"}
				begin
						member = Trello::Member.find(user_name)
						return member
				rescue
						return nil
				end
		end
		
		def trello_boards
				# Sample Object mockup
				#<Trello::Board:0x2b2b790 @attributes={:id=>"4f092b2ee23cb6fe6d1aaabd", :name=>"ruby-trello", :description=>"Ruby library wrapping the Trello API.\n\nThis board is open to other developers. Want an invite? Hit me up on twitter @jtregunna. Alternatively, if you're a member of the Trello Application Developers organization, just add yourself.", :closed=>false, :url=>"https://trello.com/b/oPndEBsA/ruby-trello", :organization_id=>"4ee269e0c9feba4446044c2f", :prefs=>{"permissionLevel"=>"public", "voting"=>"public", "comments"=>"public", "invitations"=>"members", "selfJoin"=>true, "cardCovers"=>true, "calendarFeedEnabled"=>true, "background"=>"blue", "backgroundColor"=>"#23719F", "backgroundImage"=>nil, "backgroundImageScaled"=>nil, "backgroundTile"=>false, "backgroundBrightness"=>"unknown", "canBePublic"=>true, "canBeOrg"=>false, "canBePrivate"=>false, "canInvite"=>true}}>
				begin
						return Trello::Board.all
				rescue
						return []
				end
		end
end

#~ c = TrelloConnector.new("747087c3c9564af25bde497d5678ab696e29432de05d53ea12e8f47f12e7d717", "f2cebc4aef5e2ebdf7fb64524160478a", "d3d7c12c7047fd57f55953bd2e30e145", "47322f44d31bd153c0c67773740fc7780f930328c02075d8d73aa423c87018ff")

#~ u = c.trello_member("me")
#~ puts u.username.inspect

#~ bob = Trello::Member.find("me")
#~ # Print out his name
#~ puts bob.full_name # "Bob Tester"
#~ puts bob.inspect # "Bob Tester"
#~ # Print his bio
#~ puts bob.bio # A wonderfully delightful test user
#~ # How about a list of his boards?
#~ puts bob.boards.inspect


#~ @client_bob = Trello::Client.new(
  #~ :consumer_key => "d3d7c12c7047fd57f55953bd2e30e145",
  #~ :consumer_secret => "47322f44d31bd153c0c67773740fc7780f930328c02075d8d73aa423c87018ff",
  #~ :oauth_token => "d2a4dc5340fbcf764876b40fe3029471e75a111b1ec9eb938590c3044900fa89",
  #~ :oauth_token_secret => "61ac13e8ad2dc29f77fadee175a9507f"
#~ )

#~ puts @client_bob.find(:members, "bobtester").inspect
#~ puts @client_bob.find(:members, "vadivelan").inspect
#~ puts @client_bob.find(:boards, "vadivelan").inspect
#~ puts Trello::Board.all.inspect
	
#~ require 'open-uri'
#~ require 'multi_json'
#~ include Trello
#~ include Trello::Authorization
#~ OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

#~ class TrelloConnector
		#~ attr_accessor :status, :token
		#~ def initialize(token, consumer_key = "d3d7c12c7047fd57f55953bd2e30e145", consumer_secret = "47322f44d31bd153c0c67773740fc7780f930328c02075d8d73aa423c87018ff")
				#~ @token = token
				#~ begin
						#~ Trello::Authorization.const_set :AuthPolicy, OAuthPolicy
						#~ OAuthPolicy.consumer_credential = OAuthCredential.new consumer_key, consumer_secret
						#~ OAuthPolicy.token = OAuthCredential.new @token, nil
						#~ @status = true
				#~ rescue
						#~ @status = false
				#~ end
				#~ return self
		#~ end
		
		#~ def get_user_info
				#~ puts "get_user_info called..."
				#~ begin
						#~ raw_data = MultiJson.decode(open("https://trello.com/1/members/me?key=d3d7c12c7047fd57f55953bd2e30e145&token=#{@token}").read)
						#~ puts raw_data.inspect
						#~ {"id"=>"530d32d869b003730ed35e5a", "avatarHash"=>"a5962e0cead65c58eb1fdf7698f5c1b1", "bio"=>"", "bioData"=>nil, "confirmed"=>true, "fullName"=>"vadivelan", "idPremOrgsAdmin"=>[], "initials"=>"V", "memberType"=>"normal", "products"=>[], "status"=>"idle", "url"=>"https://trello.com/vadivelan1", "username"=>"vadivelan1", "avatarSource"=>"gravatar", "email"=>nil, "gravatarHash"=>"b27531b6de7307fff3501872cb7a41a8", "idBoards"=>["530d32da69b003730ed35e5c"], "idBoardsInvited"=>[], "idBoardsPinned"=>["530d32da69b003730ed35e5c"], "idOrganizations"=>[], "idOrganizationsInvited"=>[], "loginTypes"=>nil, "newEmail"=>nil, "oneTimeMessagesDismissed"=>[], "prefs"=>{"sendSummaries"=>true, "minutesBetweenSummaries"=>60, "minutesBeforeDeadlineToNotify"=>1440, "colorBlind"=>false, "timezoneInfo"=>{"timezoneCurrent"=>"IST", "offsetCurrent"=>-330}}, "trophies"=>[], "uploadedAvatarHash"=>nil, "premiumFeatures"=>[]}
						#~ return raw_data
				#~ rescue
						#~ return nil
				#~ end
		#~ end
#~ end


#~ trello_obj = TrelloConnector.new("2d68d958fef5a41a89e198e2e6ccef3cf392377f1abb257d99a9cab93de05927")
#~ trello_obj.get_user_info
#~ puts "---------------"
#~ puts "connector loaded......"
#~ puts "---------------"