class Campaign < ActiveRecord::Base
  
  validates :title, presence: true, uniqueness: true
  validates :goal, presence: true, numericality: {greater_than: 10}

  def upcased_title
    title.upcase
  end

end
