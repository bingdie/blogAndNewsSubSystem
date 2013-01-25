class CreateImgnewsData < ActiveRecord::Migration
  def change
    create_table :imgnews_data do |t|
      t.string :imgnews_imgurl
      t.references :news_data

      t.timestamps
    end
    add_index :imgnews_data, :news_data_id
  end
end
