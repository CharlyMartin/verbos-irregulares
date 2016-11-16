class CreateVerbs < ActiveRecord::Migration[5.0]
  def change
    create_table :verbs do |t|
      t.string :infinitive
      t.string :simple_past
      t.string :past_participle
      t.string :translation

      t.timestamps
    end
  end
end
