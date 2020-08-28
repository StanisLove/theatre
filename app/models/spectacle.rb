class Spectacle < Sequel::Model
  def validate
    super
    validates_presence :title, message: I18n.t(:blank, scope: 'model.errors.spectacle.title')
  end
end
