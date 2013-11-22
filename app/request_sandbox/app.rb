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
      @ping_url = "#{request.base_url}#{request.path_info}".gsub("show", "ping")
      @requests = Request.where(:key => params[:splat])
      erb :show
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
        :request_method => request.request_method,
        :questy_string => request.query_string,
        :path_info => request.path_info,
        :ip => request.ip
      }
    end
  end
end