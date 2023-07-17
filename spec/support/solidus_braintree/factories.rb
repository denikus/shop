# frozen_string_literal: true

FactoryBot.define do
  # Define your Spree extensions Factories within this file to enable applications,
  # and other extensions to use and override them.
  #
  # Example adding this to your spec_helper will load these Factories for use:
  # require 'solidus_braintree/factories'

  factory :solidus_braintree_payment_method, class: SolidusBraintree::Gateway do
    name { 'Solidus Braintree Gateway' }
    active { true }
  end

  factory :solidus_braintree_source, class: SolidusBraintree::Source do
    association(:payment_method, factory: :solidus_braintree_payment_method)
    user

    trait :credit_card do
      payment_type { SolidusBraintree::Source::CREDIT_CARD }
    end

    trait :paypal do
      payment_type { SolidusBraintree::Source::PAYPAL }
    end

    trait :apple_pay do
      payment_type { SolidusBraintree::Source::APPLE_PAY }
    end
  end

  factory :solidus_braintree_address, parent: :address do
    trait :with_fixed_zipcode do
      # The Solidus address factory randomizes the zipcode. The OrderWalkThrough
      # we use in the credit card checkout spec uses this factory for the user
      # addresses. For credit card payments we transmit the billing address to
      # braintree, for paypal payments the shipping address. As we match the
      # body in our VCR settings VCR can not match the request anymore and
      # therefore cannot replay existing cassettes.

      zipcode { '21088-0255' }
    end

    if SolidusSupport.combined_first_and_last_name_in_address?
      trait :with_first_and_last_name do
        transient do
          firstname { "John" }
          lastname { "Doe" }
        end

        name { "#{firstname} #{lastname}" }
      end
    end
  end
end
