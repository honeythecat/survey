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

get('/surveys/:id') do
  @survey = Survey.find(params["id"].to_i())
  @questions = Question.all()
  erb(:survey)
end

get('/surveys/:id/edit') do
  @survey = Survey.find(params["id"].to_i())
  erb(:survey_edit)
end

patch('/surveys/:id') do
  title = params["title"]
  @survey = Survey.find(params["id"].to_i())
  @survey.update({:title => title})
  redirect('/')
end

delete('/surveys/:id') do
  @survey = Survey.find(params["id"].to_i())
  @survey.destroy()
  redirect('/')
end

# -----------------------------------------------------

post('/questions') do
end
