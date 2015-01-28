require('spec_helper')

describe(Question) do
  it { should validate_presence_of(:question) }
  it { should ensure_length_of(:question).is_at_most(140) }

  describe(:capitalize_question) do
    it("will capitalize the question") do
      question1 = Question.new(:question => "why opossum kit?", :id => nil)
      question1.save()
      expect(question1.question()).to(eq("Why opossum kit?"))
    end
  end
end
