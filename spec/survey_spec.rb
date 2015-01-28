require('spec_helper')

describe(Survey) do
  it { should validate_presence_of(:title) }
  it { should ensure_length_of(:title).is_at_most(70) }

  describe(:titlecase_title) do
    it("will titlecase the title") do
      survey1 = Survey.new(:title => "opossum kit", :id => nil)
      survey1.save()
      expect(survey1.title()).to(eq("Opossum Kit"))
    end
  end
 end
