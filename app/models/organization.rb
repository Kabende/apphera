class Organization < ActiveRecord::Base
  has_paper_trail :ignore => [:reviewers_list]
  reverse_geocoded_by :latitude, :longitude
  #before_create :check_existing
  #after_save :get_apphera_comps, :create_schedule
  serialize :reviewers_list
  include Tire::Model::Search
  include Tire::Model::Callbacks
  attr_accessible :name, :street,:latitude, :longitude,:street2, :postalcode,:apphera_id, :city, :category, :phone1, :category_id ,:phone2, :url, :facebook, :twitter, :reviewers_list, :account_id
  belongs_to :account
  belongs_to :country_codes
  has_many :task_results
  has_many :foursquare_venues
  has_many :tasks, :through => :task_results
  has_many :twitter_counts, :through => :twitter_urls
  has_many :reviewers, :through => :reviews
  has_many :aggregate_results
  has_many :facebookpages
  has_many :reviews
  has_many :ratings
  has_many :schedules
  has_many :likes
  has_many :listings
  has_many :history_items
  has_many :organization_links
  belongs_to :category
  has_many :provider_slugs
  has_many :uptime_monitors
  has_and_belongs_to_many :keywords
  has_and_belongs_to_many :facebook_urls
  has_and_belongs_to_many :twitter_urls
  has_many :rankings
  # validates_uniqueness_of :apphera_id
  has_and_belongs_to_many(:organizations,
                          :join_table => "competitors_organizations",
                          :foreign_key => "organization_a_id",
                          :association_foreign_key => "organization_b_id",
                          :uniq => true)

  accepts_nested_attributes_for :facebook_urls
  # depends on volume
  acts_as_gmappable :processing_geocoding => true
  validates :name, :street, :city, :phone1, :category_id, :postalcode, :presence => true

  #def competitors
  #  organizations
  #end

  def self.name_like(query)
    where("name like ?", "%#{query}%").first
  end

  def self.names_like(query)
    where("name like ?", "%#{query}%")
  end

  def self.streets_like(query)
    where("street like ?", "%#{query}%")
  end
  

  def create_schedule
    if self.account
      Schedule.create!(name: "new", organization_id: self.id, sequence_id: 6, in_progress: false, scheduled: Date.yesterday)
      Schedule.create!(organization_id: self.id, sequence_id: 2, name: "signup", scheduled: Date.yesterday)
    end
    Schedule.create!(name: "new", organization_id: self.id, sequence_id: 6, in_progress: false, scheduled: Date.yesterday)
    Schedule.create!(name: "aggregate", organization_id: self.id, sequence_id: 5, in_progress: false, scheduled: DateTime.now + 30.minutes)
  end
  

  def self.paginate(options = {})
       page(options[:page]).per(options[:per_page])
     end

  # define_index do
  #               # fields
  #               indexes name, :sortable => true
  #               indexes street
  #               indexes organization.category, :as => :category, :sortable => true
  #               indexes city
  #               # attributes
  #               has created_at, updated_at, latitude, longitude
  #             end

  tire do
    mapping do
      indexes :name, type: 'string', analyzer: 'snowball'
      indexes :street, type: 'string', analyzer: 'snowball'
      indexes :street2, type: 'string', analyzer: 'snowball'
      indexes :city, type: 'string', analyzer: 'snowball'
      indexes :yahooslug, type: 'string', analyzer: 'snowball'
      indexes :lat_lon, type: 'geo_point'
    end
  end

  def lat_lon
    [latitude.to_s, longitude.to_s].join(',')
  end
  
 def get_apphera_comps
   client = SocialMediaMonitoring::Client.new("ed08eba2bd5ef47bab6cb1944686fed2")
   comps = client.competitors(Category.find_by_name(self.category.name).apphera_id, self.lat_lon)
   # => cat  = Category.find(self.category_id)#self.category.apphera_id.to_i)
      comps.response.each do |c|
      org = Organization.create!(name: c.name, street: c.street,postalcode: c.postalcode, city: c.city, phone1: c.phone, category_id: self.category_id)
      self.organizations << org
      self.save
   end
  
 end
  
  def self.comps(cat_id,lat_lon,distance)
   Organization.tire.search do
    query { string(cat_id) }
    size 30
    filter :geo_distance, lat_lon: lat_lon, distance: "#{distance}km"
    #raise to_curl
  end  
end
  
  # scope :near, Proc.new { |latitude, longitude, options|
  #    options = options && options.dup || {}
  #    options.reverse_merge!(:range => 1)
  #    where(:id => Tire.search('organizations') do
  #      filter 'geo_distance', :distance => "#{options[:range]}
  #km", :lat_lon => [latitude, longitude]
  #    end.results.collect(&:id))
  #  }
  #scope :near, Proc.new { |latitude, longitude, options|
  #options = options && options.dup || {}
  #options.reverse_merge!(:range =>1)
  #where(:id => Tire.search('Organization') do
  #  filter 'geo_distance', :distance => "#{options[:range]})}km",
  #  :lat_lon => [latitude, longitude]
  #  end.results.collect(&:id))


  def to_indexed_json
    to_json(methods: ['lat_lon'])
  end

  def list_of_reviewers
    if self.reviewers_list.nil?
       reviewer_ids = self.reviewers.map {|r| r.id}.flatten
       self.reviewers_list = reviewer_ids
       self.save
       self.reviewers_list
    else
      self.reviewers_list
    end
    end


  private
def existing_org
  # code here
end

  def gmaps4rails_address
    "#{self.street}, #{self.city}, Germany}" #TODO: Hardcoded country. Thats bad
  end


end


  

