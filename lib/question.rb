class Question < ActiveRecord::Base
  validates(:question, { :presence => true, :length => { maximum: 140 } })
  before_save(:capitalize_question)

private

  define_method(:capitalize_question) do
    self.question=(question().capitalize())
  end
end
