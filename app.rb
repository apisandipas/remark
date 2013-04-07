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

  #  Serve the static front page
  get '/' do
    redirect '/index.html'
  end

  before do
    @api = API.new
  end

  get '/bryan' do
    content_type :json
    @api.json
  end

end