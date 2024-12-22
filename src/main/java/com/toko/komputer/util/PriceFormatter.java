package com.toko.komputer.util;

import java.text.DecimalFormat;

public class PriceFormatter {
    public static String formatPrice(double price) {
        if (price < 1000) {
            return String.valueOf((int) price);
        } else if (price < 1000000) {
            return new DecimalFormat("#.#K").format(price / 1000);
        } else {
            return new DecimalFormat("#.#M").format(price / 1000000);
        }
    }
}
