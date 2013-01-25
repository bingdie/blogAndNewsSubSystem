class ImgnewsDatum < ActiveRecord::Base
  belongs_to :news_data
  attr_accessible :imgnews_imgurl
end
