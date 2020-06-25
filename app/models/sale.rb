class Sale < ActiveRecord::Base
  
  #AR scope
  def self.active
    Sale.where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
  end

  def finished?
    ends_on < Date.current
  end

  def upcoming?
    starts_on > Date.current
  end

  def ongoing?
    !upcoming? && !finished?
  end
end
