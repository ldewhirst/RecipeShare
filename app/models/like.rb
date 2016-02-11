class Like < Socialization::ActiveRecordStores::Like
  belongs_to :recipe
  belongs_to :user
end
