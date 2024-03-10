package com.webtools.finalProject.Exception;

public class UserWishlistException extends Exception{
	public UserWishlistException(String message) {
        super(message);
    }

    public UserWishlistException(String message, Throwable cause) {
        super(message, cause);
    }
}
