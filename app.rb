class API
  def initialize
    @data = [
      {
        :name => 'Bryan',
        :age => '27'
      },
      {
        :name => 'Anne',
        :age => '25'
      }
    ]
  end

  def json 
    Yajl.dump @data
  end

end

class App < BP::Sinatra::Base

  get '/' do
    erb :index
  end

  before do
    @api = API.new
  end

  get '/bryan' do
    content_type :json
    @api.json
  end

end