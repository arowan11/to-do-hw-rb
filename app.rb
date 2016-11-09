require "sinatra"
require "./db/connection"

get "/" do
  erb :"home/index.html", layout: :"layout/application.html"
end

get "/lists" do
  @lists = List.all
  erb :"lists/index.html", layout: :"layout/application.html"
end

post "/lists" do
  @list = List.new(params)
  if @list.save
    redirect "/lists"
  else
    erb :"lists/new.html", layout: :"layout/application.html"
  end
end
