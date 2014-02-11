get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/tweet' do
  tweet(params[:tweet])
  redirect to('/')
end
