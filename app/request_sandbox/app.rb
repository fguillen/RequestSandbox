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

    # get "/ping/:param" do
    route :get, :post, :put, :delete, "/ping/*" do
      Request.create!(
        :key => params[:splat][0],
        :info => JSON.pretty_generate(RequestSandbox::App::request_info(request))
      )

      json :status => :ok
    end

private

    def self.request_info(request)
      {
        :ip => request.ip,
        :request_method => request.request_method,
        :path_info => request.path_info,
        :questy_string => request.query_string
      }
    end
  end
end