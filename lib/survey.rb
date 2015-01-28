class Survey < ActiveRecord::Base
  validates(:title, {:presence => true, :length => { :maximum => 70}})
end
