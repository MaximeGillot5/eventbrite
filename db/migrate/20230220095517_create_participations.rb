class CreateParticipations < ActiveRecord::Migration[7.0]
  def change
    create_table :participations do |t|
      t.string :stripe_customer_id

      t.timestamps
      t.belongs_to :user, index: true
      t.belongs_to :event, index: true
    end
  end
end