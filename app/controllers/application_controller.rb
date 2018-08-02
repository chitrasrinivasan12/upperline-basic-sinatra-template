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
    if @combo == "op1"
       erb :OP1
    elsif @combo == "op2"
       erb :OP2
    elsif @combo == "op3"
       erb :OP3
    elsif @combo == "op4"
       erb :OP4
    elsif @combo == "op5"
       erb :OP5
     elsif @combo == "op6"
       erb :OP6
       
    end 
  end
end 
 
