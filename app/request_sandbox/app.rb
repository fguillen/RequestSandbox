module RequestSandbox
  class App < Sinatra::Base
    set :sessions, true
    set :layout => :layout
    set :logging, true
    set :root, File.dirname(__FILE__)
    set :views, Proc.new { "#{root}/../../views" }
    set :public_folder, Proc.new { "#{root}/../../public" }

    get "/" do
      @message = RequestSandbox::CONFIG["message"]
      erb :hello_world
    end

    get "/other_page" do
      erb :other_page
    end
  end
end