class Question < ActiveRecord::Base
  validates(:question, { :presence => true, :length => { maximum: 140 } })

  define_singleton_method(:find_by_survey_id) do |id|
    @found_question = []
    Question.all().each() do |question|
      if(question.survey_id() == id)
        @found_question.push(question)
      end
    end
    @found_question
  end

end
