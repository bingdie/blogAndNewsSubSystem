class CreateNewsData < ActiveRecord::Migration
  def change
    create_table :news_data do |t|
      t.string :news_title
      t.text :news_content
      t.string :news_source
      t.references :news_cate

      t.timestamps
    end
    add_index :news_data, :news_cate_id
  end
end
