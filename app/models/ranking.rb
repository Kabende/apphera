class Ranking < ActiveRecord::Base
  belongs_to :organization
  belongs_to :keyword
  belongs_to :content_provider
end
