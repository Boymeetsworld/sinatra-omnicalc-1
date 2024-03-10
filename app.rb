require 'sinatra'
require 'sinatra/reloader'

get '/' do 
  erb :square
end

get '/square/new' do
  erb :square
end

post '/square/results' do
  number = params[:number].to_i
  @result = number * number
  erb :square_results
end

get '/square_root/new' do
  erb :square_root_form
end

post '/square_root' do
  number = params[:number].to_i
  @result = Math.sqrt(number)
  erb :result
end

get '/random/new' do
  erb :random_form
end

post '/random' do
  min = params[:min].to_i
  max = params[:max].to_i
  @result = rand(min..max)
  erb :result
end

get '/payment/new' do
  erb :payment_form
end

post '/payment' do
  apr = params[:apr].to_f
  years = params[:years].to_i
  present_value = params[:present_value].to_f
  
  monthly_interest_rate = apr / 12 / 100
  months = years * 12
  monthly_payment = present_value * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**-months))
  
  @result = monthly_payment.round(2)
  erb :result
end
