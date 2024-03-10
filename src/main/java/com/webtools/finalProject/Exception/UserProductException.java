package com.webtools.finalProject.Exception;

public class UserProductException extends Exception{
	public UserProductException(String message) {
        super(message);
    }

    public UserProductException(String message, Throwable cause) {
        super(message, cause);
    }
}
