class RecordSerializer < ActiveModel::Serializer
  attributes :id, :symptom, :date, :details
  # has_one :user
end
