class NewsCate < ActiveRecord::Base
  has_many :news_data, :dependent => :destroy
  attr_accessible :new_catedesc, :news_catename, :news_iconurl, :news_data
  validates :new_catedesc, :presence => true
  validates :news_catename, :presence => true

end
