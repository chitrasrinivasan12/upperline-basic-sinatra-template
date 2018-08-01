require './config/environment'
require './app/models/sample_model'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    return erb :index
  end
  
  post '/results' do
    answers = params.values 
    @total = 0 
    answers.each do |answer|
      @total += answer.to_i 
    end
    puts @total 
    
    @combo = health_generator(@total)
    if @combo == "OP1"
      erb :OP1
    elsif @combo == "OP2"
      erb :OP2
    elsif @combo == "OP3"
      erb :OP3
    end 
  end
  
end
