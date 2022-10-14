class AddTravelReferenceToPatients < ActiveRecord::Migration[7.0]
  def change
    add_reference :patients, :travel
  end
end
