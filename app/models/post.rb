class Post < ActiveRecord::Base

  def text_xor_url
   if text.blank? && url.blank?
     errors.add(:url, " or text must be present")
     return false
   end
    if !text.blank? && !url.blank?
      errors.add(:text, "and url are exclusive")
      return false
    end
    true
  end
  
  validates_presence_of :title, :user
  validates_uniqueness_of :title
  validate :text_xor_url
  
  validates_uniqueness_of :url, :allow_blank => true
  validates_format_of :url, :with => URI::regexp(%w(http https)), :allow_blank => true
  belongs_to :user
  
end
