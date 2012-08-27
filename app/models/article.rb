class Article < ActiveRecord::Base
  attr_accessible :title, :body, :remove_attachment, :coordinates, :address, :map_title, :tag_list, :author_id, :published
  has_many :article_attachments, dependent: :destroy
  accepts_nested_attributes_for :article_attachments
  validates :map_title, presence: true, :if => :address_present?
  validates :author_id, presence: true, on: :save
  validates :body, presence: true, on: :save
  validates :title, presence: true, on: :save
  belongs_to :author, class_name: "Admin", foreign_key: "author_id"
  
  acts_as_taggable
  
  has_many :comments
  
  scope :published, where(published: true)
  
  def check_and_encode_address
    if address.blank?
      self.coordinates = nil
    else
      res = Geokit::Geocoders::GoogleGeocoder.geocode(address)
      self.coordinates = res.ll
    end
    save!
  end
  
  private
  def address_present?
    address.present?
  end
  
  
end
