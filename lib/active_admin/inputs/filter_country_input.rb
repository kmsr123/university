module ActiveAdmin
  module Inputs
    class FilterCountryInput < FilterSelectInput
      include FilterBase
 
      def collection
        ::ActionView::Helpers::FormOptionsHelper::COUNTRIES
         = ISO3166::Country::Names.map{ |(name,id)| [name.html_safe,id] }
       require 'country_select'
      end
 
    end
  end
end