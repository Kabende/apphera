class Keyword < ActiveRecord::Base
  after_create :create_schedule
  has_and_belongs_to_many :organizations
  has_many :rankings
  attr_accessible :name
   validates :name, :length => { :in => 3..80 }

  def create_schedule
     payload = {keyword: self.name, keyword_id: self.id, count: 0}.to_json
     Schedule.create!(name:"ranks", organization_id: 99, sequence_id: 7, description: payload,scheduled: DateTime.now - 5.minutes)
  end
end
