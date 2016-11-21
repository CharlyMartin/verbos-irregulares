class CreateTempEmails < ActiveRecord::Migration[5.0]
  def change
    create_table :temp_emails do |t|
      t.string :f_name
      t.string :l_name
      t.string :email

      t.timestamps
    end
  end
end
