require "rubygems"
require "sinatra"
require "haml"

PATH = "/some/dir/Downloads"

get "/index" do
  @list = `ls -altrh #{PATH}`.split("\n")
  puts @list.inspect
  haml :index
end

post "/upload" do
  File.open(PATH + "/" + params["file"][:filename], "wb")  do |f|
    f.write(params['file'][:tempfile].read)
  end

  redirect "/index", 303
end
