class CreatePostTags < ActiveRecord::Migration
  def change
    create_table :post_tags, id: false do |t|
      t.belongs_to :post, index: true
      t.belongs_to :tag, index: true
    end
  end
end
