package com.webtools.finalProject.Controller;

import com.google.gson.annotations.SerializedName;

class CreatePayment {
    @SerializedName("items")
    Object[] items;

    public Object[] getItems() {
        return items;
    }
}
