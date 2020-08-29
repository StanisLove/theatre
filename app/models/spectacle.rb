class Spectacle < Sequel::Model
  one_to_many :demonstrations

  def validate
    super
    validates_presence :title, message: I18n.t(:blank, scope: 'model.errors.spectacle.title')
    validates_unique   :title
  end
end
