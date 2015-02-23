class CreateNewsletterUsers < ActiveRecord::Migration
  def change
    create_table :newsletter_users do |t|
      t.string :email
      t.text :subject, array: true, default: []

      t.timestamps null: false

    end
  end
end
