require 'sinatra'
require 'json'

class TwitterFeed < Sinatra::Base

  def initialize
    @tweets = [
      {
        id: 1,
        message: 'if your grave doesnt say "rest in peace" on it you are automatically drafted into the skeleton war',
        username: 'dril'
      },
      {
        id: 2,
        message: 'i like to push my body to the limit but not in the healthy living way more like in the how much pasta can i eat before i cant move way.',
        username: 'tinatbh'
      },
      {
        id: 3,
        message: 'is there anything more capitalist than a peanut with a top hat, cane, and monocle selling you other peanuts to eat.',
        username: 'skullmandible'
      },
      {
        id: 4,
        message: 'Isn\'t every show pretty much a Walking Dead prequel?.',
        username: 'kumailn'
      },
      {
        id: 5,
        message: 'If you live to be 100, you should make up some fake reason why, just to fuck with people... like claim you ate a pinecone every single day.',
        username: 'GuyEndoreKaiser'
      }
    ]

    super
  end

  before do
    content_type :json
  end

  helpers do

    def next_tweet_id
      @tweets.last[:id].to_i + 1
    end

  end

  get '/tweets' do
    @tweets.to_json
  end

  get '/tweets/:id' do
    @tweet = @tweets.find { |t| t[:id] == params[:id].to_i }

    if @tweet.nil?
      halt [404]
    else
      @tweet.to_json
    end
  end

  post '/tweets' do
    params = JSON.parse(request.env['rack.input'].read)

    halt [400, 'Parameter message is missing'] if params['message'].nil?
    halt [400, 'Parameter username is missing'] if params['username'].nil?

    @tweets << {
      id: next_tweet_id,
      message: params['message'],
      username: params['username']
    }

    @tweets.last.to_json
  end

end
