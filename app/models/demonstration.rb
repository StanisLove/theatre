class Demonstration < Sequel::Model
  many_to_one :spectacle

  # def validate
  #   super
  #   validates_presence :start_date, message: I18n.t(:blank, scope: 'model.errors.demonstration.start')
  #   validates_presence :finish, message: I18n.t(:blank, scope: 'model.errors.demonstration.finish')
  # end
end
