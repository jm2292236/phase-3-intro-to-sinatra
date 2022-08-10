require 'sinatra'

class App < Sinatra::Base
    # Add this line to set the Content-Type header for all responses
    set :default_content_type, 'application/json'
    
    get '/hello' do
        '<h2>Hello <em>World</em>!</h2>'
    end
    
    get '/potato' do
        "<p>Boil 'em, mash 'em, stick 'em in a stew</p>"
    end
    
    get '/dice' do
        dice_roll = rand(1..6)
        "<h2>You rolled a #{dice_roll}</h2>"
    end
    
    get '/dice_js' do
        dice_roll1 = rand(1..6)
        dice_roll2 = rand(1..6)
        dice_roll3 = rand(1..6)
        {roll1: dice_roll1, roll2: dice_roll2, roll3: dice_roll3}.to_json
    end
    
    get '/add/:num1/:num2' do
        num1 = params[:num1].to_i
        num2 = params[:num2].to_i
        
        sum = num1 + num2
        {result: sum}.to_json
    end
    
    get '/params/:param1/:param2/:param3' do
        p1 = params[:param1]
        p2 = params[:param2]
        p3 = params[:param3]
        
        {param1: p1, param2: p2, param3: p3}.to_json
    end
    
    # get '/games/:id' do
    #     game = Game.find(params[:id])
    #     game.to_json
    # end

end

run App
