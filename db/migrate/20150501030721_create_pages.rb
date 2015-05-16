class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.text :word
      t.text :content
      t.text :knowledge, :default => 'Learning'
      t.timestamps
    end
  end
end
