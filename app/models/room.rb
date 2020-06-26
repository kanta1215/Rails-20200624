class Room < ApplicationRecord
  has_many :entries, dependent: :destroy

  before_validation :remove_space

  validates :name, :place, :number, presence: true
  validates :name, length: {maximum: 30}
  validates :place, inclusion: {in: ['東京', '大阪', '福岡', '札幌', '仙台', '名古屋', '金沢']}
  validates :number, numericality: {greater_than: 4, less_than: 31}
  #validates :name, format: {with: /\A.+#\d{2}\z/}
  validate :name_format
  validate :check_number

  private
    def name_format
      pattern = /\A.+#\d{2}\z/
      unless pattern.match(self.name)
        errors.add(:name, "会議室名が正しくありません")
      end
    end

    def check_number
      if (self.number.to_i % 5) != 0
        errors.add(:number, "収容人数は5の倍数で指定してください")
      end
    end

    def remove_space
      self.name = self.name.strip.gsub(/ +/, "_")
    end
end
