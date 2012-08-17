class Article < ActiveRecord::Base
  attr_accessible :title, :body, :remove_attachment, :coordinates, :address, :map_title
  has_many :article_attachments, dependent: :destroy
  accepts_nested_attributes_for :article_attachments
  validates :map_title, presence: true, :if => :address_present?
  def check_and_encode_address
    if address.blank?
      self.coordinates = nil
    else
      res = Geokit::Geocoders::GoogleGeocoder.geocode(address)
      self.coordinates = res.ll
      self.suggested_bounds = res.suggested_bounds
    end
    save!
  end
  
  private
  def address_present?
    address.present?
  end
  
  
end
