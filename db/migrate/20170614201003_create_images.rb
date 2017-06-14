class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.text      :description
      t.string    :url
      
      t.timestamps
    end
  end
end
