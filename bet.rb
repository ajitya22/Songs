require 'sinatra'
require 'shotgun'

get '/bet/:stakes/at/:num' do
	stake = params[:stakes].to_i
	locked = params[:num].to_i
	roll = rand(6) + 1
	if locked == roll
		"dice number is #{roll}.Congrats you have won #{5*stake} million dollers."
	else
	  "dice number is #{roll}.You have lost #{stake} million dollers."
	end
	# (5*5).to_s
end

# not_found do
# 	status 404
# 	'not found'
# end