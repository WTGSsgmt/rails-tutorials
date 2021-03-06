class User < ApplicationRecord
  before_save {email.downcase!}
  # 省略してかけるが，まだわかりにくいので()つきで書く
  # validates :name, presence: true
  validates(:name,
            presence: true,
            length: { maximum: 50 }
  )
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:email,
            presence: true,
            length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: {case_sensitive: false}
  )
  has_secure_password
  # セキュアにハッシュ化したパスワードを、データベース内のpassword_digestという属性に保存できるようになる。
  # 2つのペアの仮想的な属性 (passwordとpassword_confirmation) が使えるようになる。また、存在性と値が一致するかどうかのバリデーションも追加される。
  # authenticateメソッドが使えるようになる (引数の文字列がパスワードと一致するとUserオブジェクトを、間違っているとfalseを返すメソッド) 。
  validates(:password,
            presence: true,
            length: {minimum: 6}
  )

end
