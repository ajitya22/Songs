require 'sinatra'
require 'shotgun'
require 'slim'
get '/' do
	slim :test
end
get '/frank' do
	naam = 'Frank'
  "Hello #{naam}!!"
end

get '/time/:number' do
	num = params[:number].to_i
  num
  # puts params[:number]
  will = Time.new + num*3600
  "after given #{num} number time will be #{will}"
end
# str1 = 'name'
# str3 = 'name'
# str2 = :name
# str4 = :name
# puts str2.object_id
# puts str1.object_id
# puts str3.object_id
# puts str4.object_id