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
  @this_surveys_questions = Question.find_by_survey_id(@survey.id())
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
  question = params["question"]
  survey_id = params["survey_id"].to_i()
  @question = Question.new({:question => question, :survey_id => survey_id})
  @question.save()
  @survey = Survey.find(survey_id)
  redirect("/surveys/#{survey_id}")
end

get('/questions/:id/edit') do
  @question = Question.find(params["id"].to_i)
  erb(:question_edit)
end


patch('/questions/:id') do
  question = params["question"]
  @question = Question.find(params["id"].to_i())
  @question.update({:question => question})
  survey_id = @question.survey_id()
  redirect("/surveys/#{survey_id}")
end

delete('/questions/:id') do
  @question = Question.find(params["id"].to_i)
  @question.destroy()
  survey_id = @question.survey_id()
  redirect("/surveys/#{survey_id}")
end
