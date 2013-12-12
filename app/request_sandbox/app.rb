module RequestSandbox
  class App < Sinatra::Base
    set :sessions, true
    set :layout => :layout
    set :logging, true
    set :root, File.dirname(__FILE__)
    set :views, Proc.new { "#{root}/../../views" }
    set :public_folder, Proc.new { "#{root}/../../public" }

    register Sinatra::MultiRoute
    helpers Sinatra::JSON

    get "/" do
      erb :home
    end

    get "/show/*" do
      @key = params[:splat][0]
      @requests = Request.where(:key => @key).order("created_at desc")
      erb :show
    end

    get "/js/*" do
      @key = params[:splat][0]
      @requests = Request.where(:key => @key)

      json @requests.map(&:to_hash)
    end

    get "/reset/*" do
      @key = params[:splat][0]
      Request.where(:key => @key).delete_all
      redirect "/show/#{@key}"
    end


    # all "/ping/*"
    route :get, :post, :put, :delete, "/ping/*" do
      Request.create!(
        :key => params[:splat][0],
        :info => RequestSandbox::App::request_info(request)
      )

      json :status => :ok
    end

private

    def self.request_info(request)
      headers = {}

      request.env.keys.select{ |key| key =~ /^HTTP_/ }.each do |key|
        headers[key] = request.env[key]
      end

      {
        :ip => request.ip,
        :request_method => request.request_method,
        :path_info => request.path_info,
        :questy_string => request.query_string,
        :headers => headers
      }
    end
  end
end