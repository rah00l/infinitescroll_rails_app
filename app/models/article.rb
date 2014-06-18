class Article < ActiveRecord::Base
  attr_accessible :content, :name

  def timestamp
    created_at.strftime('%d %B %Y %H:%M:%S')
  end
end
