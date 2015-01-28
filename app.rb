require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @surveys = Survey.all()
  erb(:index)
end

post('/surveys') do
  title = params["title"]
  survey = Survey.new({:title => title, :id => nil})
  survey.save()
  redirect('/')
end
