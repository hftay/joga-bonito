     
require 'pg'
require 'sinatra'
# require 'sinatra/reloader'
require 'pry'

# ----------------- set up database connection ----------------- 
def run_db (sql)
	conn = PG.connect(dbname: 'dream_team')
	return conn.exec(sql)
end

# ----------------- read homepage "dream team" ----------------- 
get '/' do
  erb :index
  redirect '/dream_team'
end

get '/dream_team' do
	sql = 'SELECT * from footballers;'
	@dream_team = run_db(sql) # returns x objects, forEach to access each object
  erb :dream_team
end

# ----------------- read player "profile" page ----------------- 
get '/profile/:player_id' do
	sql = "SELECT * from footballers WHERE id = #{params['player_id']};"
	@player = run_db(sql).first #.first to access hash within obj
	erb :player_profile
end

# ----------------- update "dream team" page ----------------- 
get '/update_info/:player_id' do
	sql = "SELECT * from footballers WHERE id = #{params['player_id']};"
	@player = run_db(sql).first
  erb :update_info
end

put '/profile/:player_id' do
	# binding.pry
	sql = "UPDATE footballers SET name = '#{params['name']}', age = '#{params['age']}', goals_scored = '#{params['goals_scored']}', assists = '#{params['assists']}', image_url = '#{params['image_url']}' WHERE id = #{params['player_id']};" #params is generated here because there the key(name)-value pair is specified in update_info.rb
	run_db(sql)
	redirect "/profile/#{params['player_id']}"
end

# ----------------- create a resource ----------------- 

post '/dream_team' do 
	sql = "INSERT INTO footballers (name, image_url) VALUES ('#{params['name']}', '#{params['image_url']}');"
	run_db(sql)
  redirect '/dream_team'
end

# ----------------- delete a resource ----------------- 
delete '/dream_team' do 
#note: deliberately created 'player_id' in delete form by assigning it to a hidden input
  # binding.pry
  sql = "DELETE FROM footballers WHERE id = #{params['player_id']};"
  run_db(sql)
  redirect '/dream_team'
end
# binding.pry




