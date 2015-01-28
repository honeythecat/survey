class Survey < ActiveRecord::Base
  validates(:title, { :presence => true, :length => { maximum: 70 } })
  before_save(:capitalize_title)

private

  define_method(:capitalize_title) do
    self.title=(title().titlecase())
  end
end
