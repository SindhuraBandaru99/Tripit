package com.webtools.finalProject.Controller;

import com.stripe.exception.StripeException;
import com.stripe.model.PaymentIntent;
import com.stripe.param.PaymentIntentCreateParams;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.logging.Filter;
import java.util.logging.LogRecord;

@RestController
public class PaymentController implements Filter {
    @CrossOrigin(origins = "*")
    @PostMapping("/create-payment-intent")
    public CreatePaymentResponse createPaymentIntent(@RequestBody CreatePayment createPayment) throws StripeException {
//            CreatePayment postBody = gson.fromJson(request.body(), CreatePayment.class);
            PaymentIntentCreateParams params =
                    PaymentIntentCreateParams.builder()
                            .setAmount(15 * 100L)
                            .setCurrency("usd")
                            .setAutomaticPaymentMethods(
                                    PaymentIntentCreateParams.AutomaticPaymentMethods
                                            .builder()
                                            .setEnabled(true)
                                            .build()
                            )
                            .build();

            // Create a PaymentIntent with the order amount and currency
            PaymentIntent paymentIntent = PaymentIntent.create(params);

            return new CreatePaymentResponse(paymentIntent.getClientSecret());

    }

    @Override
    public boolean isLoggable(LogRecord record) {
        return false;
    }
}
