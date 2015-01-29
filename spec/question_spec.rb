require('spec_helper')

describe(Question) do
  it { should validate_presence_of(:question) }
  it { should ensure_length_of(:question).is_at_most(140) }

end
