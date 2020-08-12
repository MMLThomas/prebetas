class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def home
  end
  
end
