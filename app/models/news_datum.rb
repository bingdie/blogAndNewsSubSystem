class NewsDatum < ActiveRecord::Base
  belongs_to :news_cate
  has_many :imgnews_data, :dependent => :destroy
  attr_accessible :news_content, :news_source, :news_title, :news_cate, :imgnews_data
  validates :news_content, :presence => true
  validates :news_source, :presence => true
  validates :news_title, :presence => true
end
