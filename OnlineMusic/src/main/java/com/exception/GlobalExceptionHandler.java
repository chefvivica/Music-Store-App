package com.exception;

import java.util.Date;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;

@ControllerAdvice
public class GlobalExceptionHandler {
		
		@ExceptionHandler(DataNotFoundException.class)
		public String resourceNotFoundHandling(DataNotFoundException exception, WebRequest request){
			ErrorDetails errorDetails = 
					new ErrorDetails(new Date(), exception.getMessage(), request.getDescription(false));
			return "redirect:/error-page";
		}

		// handling global exception
		
		@ExceptionHandler(Exception.class)
		public String globalExceptionHandling(Exception exception, WebRequest request){
			ErrorDetails errorDetails = 
					new ErrorDetails(new Date(), exception.getMessage(), request.getDescription(false));
			return "redirect:/error-page";
		}
}
