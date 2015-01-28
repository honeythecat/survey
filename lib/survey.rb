class Survey < ActiveRecord::Base
  validates(:title, { :presence => true, :length => { maximum: 70 } })
  before_save(:titlecase_title)

private

  define_method(:titlecase_title) do
    self.title=(title().titlecase())
  end
end
