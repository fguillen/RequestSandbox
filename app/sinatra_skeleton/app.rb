require "sinatra/base"
require "json"

require_relative "../sinatra_skeleton"

module SinatraSkeleton
  class App < Sinatra::Base
    set :sessions, true
    set :layout => :layout
    set :logging, true
    set :root, File.dirname(__FILE__)
    set :views, Proc.new { "#{root}/../../views" }
    set :public_folder, Proc.new { "#{root}/../../public" }

    get "/" do
      @message = SinatraSkeleton::CONFIG["message"]
      erb :hello_world
    end

    get "/other_page" do
      erb :other_page
    end
  end
end