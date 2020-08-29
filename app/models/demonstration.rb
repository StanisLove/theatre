class Demonstration < Sequel::Model
  many_to_one :spectacle

  def validate
    super
    validates_presence :dates, message: I18n.t(:blank, scope: 'model.errors.demonstration.dates')
  end
end
