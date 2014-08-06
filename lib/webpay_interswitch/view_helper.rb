module WebpayInterswitch
  module ViewHelper

    def form_for_webpay(txn_ref, amount, cust_id, cust_name, html_options={})
      form_builder = WebpayInterswitch::FormBuilder.new(txn_ref, amount, cust_id, cust_name, html_options)
      WebpayInterswitch::Gateway.new.validate!
      form_builder.generate_webpay_form.html_safe if form_builder.valid?
    end

  end
end