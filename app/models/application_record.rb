class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def t_enum(attr)
    I18n.t("activerecord.attributes.#{self.class.model_name.i18n_key}.#{attr.to_s.pluralize}.#{self.public_send(attr)}")
  end

  def self.t_enum(attr, value)
    I18n.t("activerecord.attributes.#{self.model_name.i18n_key}.#{attr.to_s.pluralize}.#{value}")
  end
end
